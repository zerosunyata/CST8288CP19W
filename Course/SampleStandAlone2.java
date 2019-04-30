package htmlsamplehibernate;

import entity.Courses;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author Shariar
 */
public class SampleStandAlone2 {

    private Courses course;
    private List<Courses> list;
    private Root<Courses> root;
    private Predicate predicate;
    private EntityManager manager;
    private CriteriaBuilder builder;
    private Path<String> columnPath;
    private TypedQuery<Courses> query;
    private EntityManagerFactory factory;
    private EntityTransaction transaction;
    private CriteriaQuery<Courses> criteria;

    public void run() {
        //get factory with the unit name defined in persistence.xml
        factory = Persistence.createEntityManagerFactory("Registrar");
        //create a EntityManger which handles the communication to DB
        manager = factory.createEntityManager();
        //start the connection
        transaction = manager.getTransaction();
        transaction.begin();
        //create a new course
        course = new Courses("test103", "oop3");
        //get a JPQL builder, a sql in OOP manner
        builder = manager.getCriteriaBuilder();
        //create a query condition for given class
        criteria = builder.createQuery(Courses.class);
        //get the root table with entity class that has the data type
        root = criteria.from(Courses.class);
        //select everything where the courseNum column is same as c1.getCourseNum()
        columnPath = root.get("courseNum");
        predicate = builder.equal(columnPath, course.getCourseNum());
        criteria.select(root);
        criteria.where(predicate);
        //get all matching rows
        query = manager.createQuery(criteria);
        list = query.getResultList();
        if (list.isEmpty()) {
            print("Adding new: " + course);
            //add a course
            manager.persist(course);
        } else {
            print("Removing already Existing: " + course);
            //save the course to manager
            course = manager.merge(course);
            //remove the managed course
            manager.remove(course);
        }
        //commit changes to DB
        transaction.commit();
        //create a query condition for given class
        criteria = builder.createQuery(Courses.class);
        //get the root table with entity class that has the data type
        root = criteria.from(Courses.class);
        //select everything from the DB
        criteria.select(root);
        //execute query with created criteria and store result in list
        query = manager.createQuery(criteria);
        list = query.getResultList();
        System.out.println("Printing All");
        for (Courses c : list) {
            print(c);
        }
        //create a query condition for given class
        criteria = builder.createQuery(Courses.class);
        //get the root table with entity class that has the data type
        root = criteria.from(Courses.class);
        //select everything where the name column contains oop
        columnPath = root.get("name");
        predicate = builder.like(columnPath, "%oop%");
        criteria.select(root);
        criteria.where(predicate);
        //execute query with created criteria and store result in list
        query = manager.createQuery(criteria);
        list = query.getResultList();
        System.out.println("Printing Only OOP");
        for (Courses c : list) {
            print(c);
        }
        //close managet, transaction is now closed
        manager.close();
        //hibernate is shutoff
        factory.close();
    }
    
    public <T> void print( T t){
        System.out.println( t);
    }

    public static void main(String[] args) {
        new SampleStandAlone2().run();
    }
}
