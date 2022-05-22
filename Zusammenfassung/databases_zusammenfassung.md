Data Modelling and Databases 1
authorization by Jens Eirik Saethre

 August 20, 2018
1Licence: Creative Commons Attribution-Share Alike 3.0 Unported (http://creativecommons.org/licenses/by-sa/3.0/)
Contents
0 Introduction 1
0.1 Data Modelling . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1 Entity-Relationship Model 1
1.1 General Concepts & Notation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.2 Design Principles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.3 Constraints in the ER model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.4 Weak Entity Sets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
2 The Relational Data Model 5
2.1 Overview of Data Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.2 The Relational Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.3 ER to Relational Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.4 Relational Algebra . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
2.5 Relational Calculus . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
3 SQL: Structured Query Language 8
3.1 DDL: Data Definition Language . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
3.2 DML: Data Manipulation Language . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
3.3 Simple Queries in SQL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
3.4 Queries on multiple Relations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
3.5 Full-Relation Operations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
3.6 Subqueries . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
3.7 Views . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
3.8 Recursion . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
4 Integrity Constraints 14
4.1 Checking in DB vs. Application . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
4.2 Simple Constraints . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
4.3 Keys and Foreign Keys . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
4.4 Maintaining Referential Integrity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
5 Functional Dependencies 16
5.1 Keys of Relations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
5.2 Rules about Functional Dependencies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
5.3 Design of Relational Database Schemas . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
5.4 Decomposition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
6 Normal Forms 19
6.1 First Normal Form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
6.2 Second Normal Form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
6.3 Third Normal Form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
6.4 BCNF . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
6.5 Multivalued Dependencies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
6.6 Fourth Normal Form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
6.7 Normal Forms Comparison . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
7 Schemas 22
7.1 OLTP: Online Transaction Processing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
7.2 OLAP: Online Analytical Processing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
7.3 Modern trends for Database schemas . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
7.4 Example: The TPC schema . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
8 Database Systems 23
8.1 Memory Hierarchies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
8.2 Storage Systems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
8.3 Storing Data . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
8.4 Buffer Management . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
8.5 Catalog: Managing Metadata . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
1
9 Query Processing 25
9.1 Scans . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
9.2 Sorting . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
9.3 Joins . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
9.4 Hashing vs. Sorting . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
9.5 Group-By . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
10 Query Optimization 27
10.1 Execution Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
10.2 Choosing Operators . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
10.3 Equivalence Rules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
10.4 Query Enumeration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
11 Transaction Processing 29
11.1 ACID Principle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
11.2 Schedules & Serializability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
11.3 Conflict-Serializability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
11.4 Enforcing Serializability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
11.5 Locking . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
11.6 Granularity of Locks & Hierarchical Locking . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
11.7 Snapshot Isolation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
11.8 Recovery Theory . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
12 Recovery 34
12.1 Issues & Models for Resilient Operations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
12.2 Undo Logging . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
12.3 Redo Logging . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36
12.4 Undo/Redo Logging . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
13 Atomic Commits 38
13.1 Distributed Consensus . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
13.2 2-Phase Commit Protocol . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
13.3 3-Phase Commit Protocol . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
13.4 Termination Protocol . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
14 Replication 40
14.1 Database Replication Strategies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
14.2 Dealing with Site Failures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
14.3 Dealing with Communication Failures & Quorums . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
15 Key Value Stores 41
0 Introduction
A DMBS is a tool that pushes the complexity of dealing with the data to the database rather than to the program, and
can thus be used by non computer scientists. As such, all important features like redundancy and inconsistency avoidance,
providing concurrent accesses and the possibility to recover from power/system failures are provided and need not be
reprogrammed.
0.1 Data Modelling
We try to model the ”real world” in a manner such that everyone has the exact same viewpoint of the thing to be modelled.
This involves 3 steps:
1. Conceptual Modelling: capture domain/world to be modelled. consists of entities and how they relate to each
other, e.g. ER, UML
2. Logical Model: Maps to conceptual model to a concrete logical representation i.e. a schema. E.g. SQLite, SQL,
COBOL, XML
3. Physical Model: describes how the model is physically implemented in a concrete hardware setting.
Note: a model does not contain details that are common sense but not explicitly told, e.g. that age must be > 0.
We primarily focus on the Entity-Relationship and the relational model in this course.
1 Entity-Relationship Model
The ER model is a conceptual model to graphically represented the structure of data by using Entity Sets, Attributes and
Relationships
1.1 General Concepts & Notation
• Entity Sets: an entity is an abstraction of a real-world object, a collection of entities form an entity set.
• Attributes: an entity set has attributes which are properties of the entities in that set. can be both primitive types
or “structs”.
• Relationships: connections among 2+ entity sets that represent some relation.
An Entity-Relationship Diagram is the graph that represents and connects the above mentioned concepts visually. We
use rectangles, ovals, diamonds for entity sets, attributes and relationships, respectively. We use edges to connect entity
sets with their corresponding attributes and to connect relationships to entity sets.
Instance of an ER Diagram
Note: ER diagrams describe schemas of databases, but they are never implemented in the ER model. Thus an instance of
a ER model never really exists in a DMBS.
• the DB will have some finite set of entities for each entity sets with particular values for each attribute
• an instance of a relationship that connects n entity sets E1, . . . , En can be imagined to consist of a finite set of
n-tuples of the form (e1, . . . , en). =⇒ this is called the relationship set R.
Binary Relationships
Let E, F be two entity sets and R a binary relationship between them: R ⊆ E1 × E2. We can distinguish three types of
R:
• N:1 / Many-One: each member of E can be connected to at most one member of F in R. (members of F can be
connected to multiple members of E)
• 1:1 / One-One: if R is both Many-One from E to F and Many-One from F to E, then we have a 1:1 correspondence.
• N:M / Many-Many: if R is not Many-One from either side.
The following graphic show the notation we use in the course. Many-One relationships from E to F are often denoted by
an arrow entering F.
1
A such Many-One relationship or in fact any relationship (also non-binary) mean that there is at most some number M
of entities that the relationship connects to. It does however not guarantee existence of a such entity.
Multiway Relationships
There are, generally speaking, two ways to model n-ary relationships:
Let E1, . . . , En denote n entity sets and let k ∈ {1, n}. A
n-ary relationship R is linear mapping defined as follows:
R : E1 × · · · × Ek−1 × Ek+1 × · · · × En → Ek
In this case, it is always necessary that one of the partaking entities has cardinality one, such that the mapping is
well defined.
We can now define mappings for such relationship, where
the image of the mapping is an entity set which has cardinality 1 in the relation.
Secondly, we can use the (min, max)-Notation for such nary relationships. Let E1, . . . , En denote n entity sets and
let R ⊆ E1 × · · · × En be a relationship: Let i ∈ {1, n}.
Now for the above image, it holds that ∀ ei ∈ Ei
:
• at least mini records (. . . , ei
, . . .) exist in R
• at most maxi records (. . . , ei
, . . .) exist in R
Example: Geometric Modelling
Consider the following ER graph that models a Polyhedron. We can obtain the following information:
• covers is a 1 : N relation between Polyhedron and Surfaces. This means that
one Polyhedron can cover multiple surfaces, but one surface is covered by exactly
one Polyhedron only.
• boundary is a N : M relation between Surfaces and Edges, meaning that one
surface is bounded by multiple edges, and one edge bounds multiple surfaces.
The same can be done for the startEnd relation. Now with (min,max)-Notation, we
can describe the model more precisely:
• One Polyhedron covers at least 4 surfaces. One surface is covered by exactly one
polyhedron.
• One Surface is bounded by at least 3 edges. One Edge bounds exactly two
surfaces
Roles in Relationships
If a entity set appears multiple times in a single relationship, we draw as many lines
as necessary, where each edge represents a different role which the given entity set plays in the relationship. =⇒ label
edges with names, called roles.
An instance of the relationship is a 4-tuple (star, movie, studio1, studio2). From the two
arrows in the ER diagram, we can conclude:
(i) given a star, a movie and the producing studio, the owning studio is uniquely determined.
(ii) given a star, a movie and the owning studio, the producing studio is uniquely determined.
(iii) however, given a movie and both the studios, we cannot uniquely determine a star,
because a studio might loan multiple stars for the same movie.
2
Note: actually the owning or producing studio are uniquely determined by a single attribute, namely the star or the movie,
respectively, although the depicted diagram does not show that!
Attributes on Relationship
Sometimes it is convenient to associate attributes with a relationship: E.g. when a entity set Studio has a relationship
contracts with another entity set Star and we would like to store the contract’s negotiated Salary. Can also place more
attributes like Signature Date etc. on the relationship.
It is actually never necessary to place attributes on relationship, one could always invent a new entity set with attributes
ascribed to the relationship, however this might be impractical.
Converting Multiway to Binary Relations
Any relationship connecting 2+ entity sets can be converted to a collection of binary, many-one relationships =⇒
introduce new connecting entity set whose entities can be thought of as tuples of the relationship. Then introduce manyone relationships from connecting to each entity that provides at least one component of the tuple. If an entity set provides
multiple components, then we create accordingly many relationships with different roles.
Subclasses - “is-a” and “part-of” relationships
Aggregation and Generalization: remove redundancy by imposing a hierarchical tree-order on the entity sets. =⇒
makes it possible to have certain entities with special properties that differ from the general case. We denote this
relationship by a Hexagon.
A single entity consists of components from all entity sets along the path to the root, components being both relationships
and attributes.
1.2 Design Principles
• Faithfulness: entity sets and relationship should reflect reality
• Avoiding Redundancy: use aggregation & generalization techniques in order not to store repetition of facts.
• Simplicity: only store what is relevant
• Picking right kind of Element/Relationship: often relationships that are not explicitly declared in the model
can be deduced by connecting multiple adjacent relationships. Same holds true that when deciding whether a
property should be modelled as an attribute (easier to implement) or as an entity (sometimes avoids unnecessary
repetitions)
1.3 Constraints in the ER model
Keys
A key for an entity set E is the smallest set of attributes that uniquely determine any entity e ∈ E.
• there can be multiple candidate keys =⇒ choose one as the primary key.
• in a “is-a” hierarchy, we require the root entity set to have all attributes required needed for a key and that this
actually corresponds to the used key.
• Keys are represented with and underline of the corresponding attributes.
1.4 Weak Entity Sets
A Weak Entity Set is an entity set whose key is composed of attributes of which some or all belong to another entity set.
This scenario can arise in hierarchies, where e.g. a name attribute is a unique identifier within that sub-entity set, but not
overall. It only gets unique once we take into account the key of the super-entry.
• double rectangles denote weak entities
• double diamonds indicates a many-one relationship which helps to provide the key for the weak entity set, called
the supporting relationship.
• Entity sets that provide some attributes for its own key are underlined, even though they do not make up the full
key.
3
Requirements for Weak Entity Sets
• a key for a weak entity set E consists of 0 or more of its own attributes and key attributes that are reached by
supporting relationships for E with supporting entity sets.
• a supporting relationship R from a weak entity set E to F has the following attributes:
1. R must be binary, many-one from E to F s.t. for every E-entity, there exists exactly one F-entity related to it
by R.
2. F supplies key attributes of F to E.
3. in case of recursion: if F itself is weak, some are all attributes may not even come from F itself, but from
higher up the recursion tree
4. if there are several different supporting relationships from E to F, then each relationship is used to supply a
copy of the key attributes of F to help form the key of E.
4
2 The Relational Data Model
2.1 Overview of Data Models
A data modell is a notation for describing data or information and consists of:
1. structure of the data (high level view in DBMS)
2. operations on the data: queries to retrieve information, modifications to change data
3. constraints on the data: e.g. age ≥ 0.
There are generally two pre-eminent data models, namely the relational model and the semi-structured data model including
XML.
2.2 The Relational Model
A table is the only way to represent data in this data model, and a such 2-dimensional table is called a relation. A brief
summary of the terminology follows:
• Attributes: columns of a relation are named by attributes, appear at top of the columns and give meaning to the
entries below
• Schemas: the relation’s name and its attributes as a list are called a schema for the relation and are denoted by
e.g. Movie(title, year, length, genre) → no fixed order for attributes, doesn’t matter.
• Tuples: rows of the relation other than the first row =⇒ has one component for each attribute. Use same attribute
ordering that the schema defines.
• Domains: value type and range for each attribute, can be denoted in the schema e.g. by Movies(title:string,
year:integer, length:integer, genre:string)
• Instance: set of tuples for a given relation =⇒ dynamic, changes over time
• Key: set of attributes that uniquely determine a tuple for all possible instances of the relation. Such key attributes
are underlined in the schema notation. =⇒ we often use unique integers IDs as keys, even though they are artificial
concepts that do not exist in the real world.
Note: Both attributes and tuples do not have to follow any ordering principle, however, when changing the order of the
attributes, one must always reorder the attributes in all tuples and in the schema.
More formally, let D1, . . . , Dn be domains, then R ⊆ D1 × · · · × Dn is a relation and t ∈ R is a tuple. We start relation
names with capital letters and attribute names with lower-case letters. For a generic relation with three attributes, we
use the notation R(A, B, C).
NULL stands for a value that you don’t know and will generally be left out of selections. Note however, that key attribute
cannot be NULL for obvious reasons.
2.3 ER to Relational Model
Non-hierarchical ER diagrams
There are 4 basic rules to transform an Entity-Relationship diagram that does not contain hierarchical structure into a
relational table:
1. Turn non-weak entity sets into a relation with the same set of attributes and the same name.
2. Relationships: take keys of all partaking entity sets as attributes and possibly the attributes of the relationship
itself. If an entity set involves in a relationship multiple times, its key attributes must appear as many times as there
are role =⇒ rename those attributes in order to avoid name duplication
3. One can often combine relations, e.g. when R ⊆ E × F many-one. Then the relations for E, R can be comined
since they share the key of E as a common unique identifier. Values in E that are not in R will thus have NULL
values for the “key of F” attribute
4. Weak Entity sets:
• relation for a weak entity set must also include the key attributes of the supporting entity sets
5
• the relation for relationship with a weak entity sets must include all keys of the weak entity set, also those from
supporting entity sets.
• supporting relationships need not be transformed at all, since they can be added to the schema for the weak
entity sets relation
The third rule for weak entity sets W could also be states as follows:
3. construct a relations whose schema consists of all attributes of W, all attributes of supporting relationships for W,
and, for each supporting relationship with another entity E, all of E’s keys. Rename if necessary. Don’t construct
a relation for any supporting relationship
Hierarchical ER diagrams
There are principally three strategies to convert hierarchical ER diagrams into relational tables:
1. Follow the ER viewpoint: Create relation for each entity set E in the hierarchy that includes all of E’s attributes
and the key attributes from the root. =⇒ don’t create a relation for the “is-a” relationship. For other relationship
types, proceed as above.
2. Treat entities as objects belonging to a single class: enumerate all possible subtrees that include the root,
one relation for each subtree.
3. Use the NULL value: handle entire hierarchy in one relation, use NULL for attributes in tuples that are not defined
for that entity.
2.4 Relational Algebra
The following table shows the operators used in Relational Algebra.
Selection σ Set Minus − right Semi-Join o
Projection π Relational Division ÷ left Outer Join d|><|
Cartesian Product × Union ∪ right outer Join |><|d
Join ./ Intersection ∩
Rename ρ left Semi-Join n
An atom is either a relation in the database or a constant relation. Also called basic expressions.
Projection
The projection operator is used to produce from a relation
R a new relation that has only some of R’s columns. The
value of expression Q
A1,...,An
(R) is a relation that only
consists of columns for the attributes A1, . . . , An.
Selection
The selection operator applied to R produces a new relation with a subset of R’s tuples, namely those who meet
some condition C. This operation is denoted by σC (R).
Cartesian Product
The Cartesian product of relations R, S, denoted R × S,
simply concatenates every possible combination of tuples
r ∈ R, s ∈ S. If R, S have attributes in common → rename
them. In practice rarely used without join operators.
Natural Join
The natural join of relations L, R, denoted L ./ R, pairs
only those tuples from L and R that agree in whatever attributes they share commonly. Natural Join is associative!
Other variants:
• Left outer join: natural join & unmatched tuples
from L
• Right outer join: natural join & unmatched tuples
from R
• Full outer join: natural join & unmatched tuples
from both L and R
• Left semi join: tuples from L that match with some
tuple in R
• Right semi join: tuples from R that match with some
tuple in L
Theta-Join
A theta join ./θ allows to join tuples from two relations
R, S based on an arbitrary condition θ rather than solely
based on attribute agreement. We get this new relation
by:
1. take the Cartesian Product R × S
2. select those tuples satisfying conditon θ
Union, Intersection, Set Minus
requires: both relations have the same schema =⇒ then
consider set of tuples, do corresponding set operations.
Note that R ∩ S = R − (R − S)
6
Rename
• to change the name of the relation R to S, we write
ρS(R)
• to rename attributes of R, we use the operator
ρS(A1,...,An)(R) where the attributes in the result relation S are called A1, . . . , An, respectively.
Relational Division
E.g. find students who attend all lectures with 4 ECTS.
Formally:
t ∈ R÷S ⇐⇒ ∀ts ∈ S ∃tr ∈ R : tr.S = ts.S ∧ tr.(R−S) = t
The new relation consists of restrictions of tuple in R to
the attribute names unique to R for which it holds that all
their combinations with tuples in S are present in R.
2.5 Relational Calculus
Queries are of the form {t | P(t)} where t is a variable and P a predicate in t. Relational Calculus differs from relational Algebra in that the former specifies how (=procedural) something is done, whereas the latter specifies only what
(=declarative) is done. We distinguish two forms of relational calculus:
Tuple Relational Calculus
• Atoms are either of the form s | R where s is a tuple variable and R is a relation, or of the form s.A Φ t.B or
s.A Φ c where A, B are attribute names, Φ is a comparison and c is a constant.
• All Atoms are Formulas and if P1, P2 are formulas, then so are any constructs created by using the logical symbols
¬, ∧, ∨, ⇒, ∀, ∃
Safety: formulas are restricted to queries with finite answers =⇒ semantic property.
Safety means that the result must be a subset of the “domain of the formula” which means all constants used in the
formula and all domains of relations used in the formula.
Domain Relational Calculus
An expression in DRC is of the form {[v1, . . . , vn] | P(v1, . . . , vn)} where vi are either domain variables or constants and
P is a formula. Safety is defined in the same way.
Codd’s Theorem
Theorem 2.1. Relational Algebra, tuple relational calculus and domain relational calculus are equivalent. (if we
consider only safe expressions)
=⇒ SQL is based on relational calculus (since it is declarative), implemented based on relational algebra (since it is
procedural) and thus is correct and complete.
7
3 SQL: Structured Query Language
SQL is a family of standards, namely it includes a data definition language for schemas, a data manipulation language for
updates and a query language for reads. Note that SQL is case-insensitive.
3.1 DDL: Data Definition Language
The following code snippet shows the most important data definitions in SQL:
1 character ( n ) , char ( n ) -- String of length n
2 varchar ( n ) -- String of variable length but at most n characters
3 numeric (p , s ) -- decimal value with precision p and scale s
4 integer -- numeric values
5 blob , raw -- large binaries
6 date -- date value
7 clob -- large string tables
8 string1 || string2 -- concatenation operator for strings
9
10 CREATE TABLE Professor -- create a new table
11 ( PersNr integer not null ,
12 Name varchar (30) not null ,
13 Status character (2) default "AP") ;
14 DROP TABLE Professor -- delete table
15 ALTER TABLE Professor add column ( age integer ) ; -- adds new age column to table
16
17 CREATE INDEX myIndex on Professor ( name , age ) ; -- Index for performance tuning
18 DROP INDEX myIndex -- delete index
3.2 DML: Data Manipulation Language
A real database cannot be manually populated in a tuple-by-tuple manner =⇒ ETL: Extract, Transform, Load is
used to extract data from some file, which is then transformed to the data types supported by the database and then
loaded into to database as a bulk operation. Manual updates work as follows:
1 insert into Student ( Legi , Name ) -- standard insertion syntax
2 values (16 -940 -165 , ’Jens Eirik Saethre ’) ;
3
4 -- can also use a nested query to determine the tuples to be inserted .
5 insert into attends ( Legi , ’Databases ’)
6 select Legi
7 from Student
8 where semester > 2;
9
10 delete Student -- standard deletion syntax
11 where Semester > 13;
12
13 update Student -- update all tuples in Student relation table
14 set Semester = Semester + 1;
15
16 -- there are sequence types for automatic increment (e.g. useful for unique IDs )
17 create sequence PersNr_seq increment by 1 start with 1;
18 insert into Professor ( PersNr , Name )
19 values ( PersNr_seq . nextval , " Roscoe ") ;
3.3 Simple Queries in SQL
Projection & Selection
The simplest query form in SQL selects tuples from a single relation with some selection criteria and selects only the
intersting columns. This query thus combines both Selection and Projection:
1 select PersNr , Name -- use * to select all columns
2 from Professor
3 where Status = ’FP ’;
8
One can leave out the where clause to get the entire table, one can sort the table by appending the line order by Status
desc, Name asc or select only distinct entries with the keyword select distinct.
One can also rename attributes by writing select PersNr as ProfNr and use expressions in the SELECT (note that SQL
is case-insensitive) statement to modify the concerned column. The following example of a query in a movie database
combines all of the aforementioned special cases:
1 SELECT DISTINCT release AS releaseDate , length *0.16667 AS runtime
2 FROM Movies
3 WHERE genre = ’Thriller ’ AND ( rating >= 9.0 OR rating <= 2.0) ;
It returns the release date and the runtime in hours of the best and worst-rated movies in the Thriller genre stored in the
database. Note that if there are multiple movies that satisfy the condition with the same (ReleaseDate, runtime) pair,
only one tuple will appear in the returned relational table.
=⇒ like this, one can also add constant columns to the output by appending to the SELECT clause the following: ’hrs.’
AS inHours. Now the table will have three columns, the last one being the string ’hrs.’ for all tuples.
Note: <> is SQL syntax for “not equal to” and = for “equal to”.
SQL relates to relational algebra in the sense that a query SELECT L FROM R WHERE C is equivalent to the relational
algebra expression Q
L
(σC (R))
String Comparison
• comparisons of varchar and char only compares the actual string and not the padding.
• comparison with an operator like > compare the string’s lexicographical order.
Pattern Matching
We can use the pattern matching operator s LIKE p to compare a string s to a pattern p:
• ordinary characters in p match only themselves in s
• a symbol in p matches one arbitrary character in s
• a % symbol in p matches an arbitrary sequence of characters in s, also with length 0.
Dates and Times
• Dates are represented in the format DATE ’1996-12-06’
• Times are represented in the format TIME ’15:23:05.4’.
• One can combine the two to get a new type TIMESTAMP ’1996-12-06 15:23:05.4’
NULL value in SQL
The null value in SQL can either mean that the value is unknown, inapplicable or withheld.
• arithmetic operations that include NULL evaluate to NULL
• comparisons that include NULL evaluate to the truth value UNKNOWN
• the group by operator returns a group for NULL
Note: NULL is not a constant, we cannot use NULL explicitly as an operand.
UNKNOWN value in SQL
Assume TRUE = 1, FALSE = 0, UNKNOWN = 1/2. Then we have the following rules for logical operators:
• AND: minimum of the two values
• OR: maximum of the two values
• NOT: 1 − v where v was the previous value.
When selecting tuples, only those whose truth value to the query is TRUE are picked for the resulting relation. =⇒ the
following query does not necessarily return all movies:
9
1 SELECT *
2 FROM Movies
3 WHERE length <= 120 OR length > 120
If a movie’s length is in fact UNKNOWN, than that tuple will not be returned.
Sorting of Tuples
Can use the ORDER BY <list of attributes> clause to order the returned tuples. Ordering is applied before the SELECT
part, so it is possible to order on attributes that do not appear in the final output. Impose an order by using ASC, DESC,
ascending being default.
3.4 Queries on multiple Relations
Set Operations
We use the keywords UNION, INTERSECT, and EXCEPT for ∪, ∩, −, respectively. The syntax is generally as follows:
(Query1) INTERSECT (Query2);.
Products
To get the Cartesian product of two relations, simply provide both as arguments to the FROM clause, e.g. SELECT * FROM
Movies, Stars.
Joins
Use the product learned above and define in the WHERE clause which attributes should match, e.g. the following query
returns the names of the producer of ’Star Wars’, when the movie name and the producer name are stored in different
relations:
1 SELECT name
2 FROM Movies , MovieProducers
3 WHERE title = ’Star Wars ’ AND producerNr = certificateNr ;
If attributes of different relations have the same name, we reach non-ambiguity by using the dot-notation on the attributes:
RelationName.AttributeName. This is generally good practice, even when there is no ambiguity (yet).
Tuple Variables
If a query involves two ore more tuples from the same relation, we need an alias to refer to them individually. This is
achieved by the following syntax:
1 SELECT Star1 . name , Star2 . name
2 FROM MovieStar Star1 , MovieStar Star2
3 WHERE Star1 . address = Star2 . address AND Star1 . name < Star2 . name ;
Note: 1.) even though Star1 appears in the statement before it is defined, this is okay since the FROM part is evaluated
earlier. 2.) the string comparison is necessary to avoid pairing people with themselves. Further, comparison by <> would
produce each pair twice.
A problem with the semantics may arise when we think that we can use simple SQL queries for set operations like
R ∩ (S ∪ T). Assume R, S, T are all unary relations with attribute A. One would think that the following query works
perfectly fine:
1 SELECT R . A FROM R , S , T WHERE R . A = S . A OR R . A = T . A ;
However, if T were to be empty, one would expect the result to be R ∩ S, but the query returns nothing. This is due to
the semantics of multi-relational queries and how they are implemented.
3.5 Full-Relation Operations
Some operations act on relations as a whole an not just on single tuples. We have already looked at the DISTINCT keyword
to eliminate duplicates in query results. Further, set operations eliminate duplicates by default. If this is not desired =⇒
use the ALL keyword, e.g. for relations R, S:
1 R INTERSECT ALL S
returns the intersection of ”bags”
10
Grouping and Aggregation
We often want to partition the tuples into groups on which we can then apply an aggregation operator, like one of the
following:
• avg, max, min, count, sum
We can then do grouping by the clause GROUP BY which follows the WHERE clause. We can e.g. sum all the lengths of
movies given studios have produced by the query:
1 SELECT studioName , SUM ( length )
2 FROM Movies
3 GROUP BY studioName ;
Note that NULL values are ignored in any aggregation (e.g. in avg it would make a difference, in count(*) it only counts
non-NULL values). However, NULL is treated as an ordinary group.
HAVING clauses
This clause is used when we want to choose our groups based on some aggregate property of the group itself =⇒ the
HAVING clause then follows the GROUP BY. Example:
1 SELECT name , SUM ( length )
2 FROM Movies , MovieProducers
3 WHERE producerNr = certificateNr
4 GROUP BY name
5 HAVING MIN ( year ) < 1930;
This query prints the names of producers with their total movie lengths which have at least produced one movie prior to
1930.
Note: one can aggregate any attribute appearing in the relations declared in the FROM clause, but one can only use attributes
that are in the GROUP BY list in an unaggregated way.
3.6 Subqueries
A query can be part of another query itself =⇒ already saw example in set operations.
• Subqueries can return a single constant =⇒ use in WHERE clauses
• Subqueries can return relations used in WHERE clauses
• Subqueries can appear in FROM clauses followed by a tuple variable
Conditions involving Relations
We first assume unary = one-column relations for simplicity:
• EXISTS R is true ⇐⇒ R is not empty
• s IN R is true ⇐⇒ s is equal to at least 1 value in R. Can also use the NOT IN operator
• s > ALL R is true ⇐⇒ s greater than every value in R.
• s > ANY R is true ⇐⇒ s not the smallest value in R.
Note: if R returns zero rows, then any comparison with ALL clause returns true.
Conditions involving Tuples
A tuple in SQL is a parenthesized list of scalar values e.g. (name, address, networth) =⇒ if tuple t has same number
of components as relation R, we can compare it by using e.g. t IN R or t <> ANY R, the latter asking if there exists any
tuple in R that is other than t.
To find all producers of movies where Leonardo DiCaprio starred in, one can use the following query:
11
1 SELECT name
2 FROM MovieProducers
3 WHERE certificateNR IN
4 ( SELECT producerNR
5 FROM Movies
6 WHERE ( title , year ) IN
7 ( SELECT movieTitle , movieYear
8 FROM StarsIn
9 WHERE starName = ’Leonardo DiCaprio ’) ) ;
Queries like these should be analysed from inside out.
Correlated Subqueries
In a subquery, we can refer to e.g. an attribute from the relation of the FROM clause from the super-query. We can refer to
it by using an alias. This subquery then needs to be executed every time for each tuple in the super-query. An example
would be:
1 SELECT title
2 FROM Movies Old
3 WHERE year < ANY
4 ( SELECT year
5 FROM MOVIES
6 WHERE title = Old . title ) ;
This query finds all movie titles that appeared multiple times. The subquery needs to be executed for every tuple in
Movies that we are looking at. Scoping rules work similar to other mainstream programming languages.
Subqueries in FROM clauses
Can use a parenthesized query instead of a stored relation =⇒ use an alias for the result of the query to be able to refer
to it.
Problem with Universal Quantification
SQL does not support relational division directly, that’s why one has to play tricks, namely using the following:
∀t.P(t) ≡ ¬∃t.¬P(t) and R =⇒ T ≡ ¬R ∨ T
Syntactic Sugar
1 SELECT *
2 FROM STUDENT
3 WHERE semester between 1 and 6; -- variant 1
4 WHERE semester in (2 ,4 ,6) ; -- variant 2
5
6 -- case statement can be implemented like this . note that only one clause executes ,
meaning no need for break
7 SELECT legi , ( CASE WHEN grade >= 5.0 THEN ’gut ’
8 WHEN grade >= 4.0 THEN ’ausreichend ’
9 else ’nicht bestanden ’ END )
10 FROM Tests ;
Joins in SQL
1 -- Cartesian Product
2 Movies CROSS JOIN StarsIn ;
3
4 -- Theta Join ( still has all the columns from both relations -> Preceed by a SELECT
statement to reduce redundancy )
5 Movies JOIN StarsIn ON
6 title = movieTitle AND year = movieYear ; -- theta condition
7
12
8 -- Natural Join ( joins on all attributes with the same name )
9 MovieStar NATURAL JOIN MovieProducer
10
11 -- OuterJoins (FULL , LEFT or RIGHT are interchangeable in this example )
12 MovieStar NATURAL FULL OUTER JOIN MovieExec ;
SnapShot Semantics
Updates on relations are carried out in two steps, first one marks the tuples to be updated (also deleted) and in a second
step, one actually does the update. This is to prevent inconsistencies.
3.7 Views
A view is a logical relation in a DBMS. It allows for easier access of data that is complicatedly stored and could only be
accessed with both deep knowledge about the underlying way the data is stored and highly sophisticated queries.
1 CREATE VIEW < name of view > AS < sql query >;
Now one can use <name of view> just like a table. This allows for privacy and better usability resulting in simpler queries.
Views get evaluated by automatic query rewriting. Example:
1 CREATE VIEW StudProf ( Sname , Semester , Title , Pname ) AS
2 SELECT s . Name , s . Semester , l . Title , p . Name
3 FROM Student s , attends a , Lecture l , Professor p
4 WHERE s . Legi = a . Legi AND a . Nr = l . Nr AND l . PersNr = p . PersNr ;
5
6 -- now one can use this View in queries :
7 SELECT DISTINCT Semester
8 FROM StudProf
9 WHERE Pname = ’Alonso ’;
One can also use Views for “is-a” relationships by providing base tables and creating Views for frequently used concepts.
Updates
Generally, it is not possible to update a view, since the table it represents is not physically stored, and would lead to
anomalies in the physical table, e.g. when a view combines only some columns of multiple different relations. What
would a change to a view incur? Would all the relations that have some attributes in the view need to change? =⇒
inconsistencies. Same happens with aggregations. This leads to the following theorem about views in SQL:
Theorem 3.1. A SQL View is updateable ⇐⇒ the view involves only one base relation, the view involves the key of
that base relation and the view does not involve aggregates, group-by or duplicate elimination.
3.8 Recursion
omitted.
13
4 Integrity Constraints
Definition 4.1 (Integrity Constraints). Integrity Constraints impose restrictions on allowable data, beyond those
imposed by structure and types.
By using constraints, ad DBMS can make sure that changes are consistent as a part of the schema. Transactions control
data on concurrent accesses and failures. This is to avoid problems like nonsensical values e.g. negative age or non-unique
keys etc.
4.1 Checking in DB vs. Application
It is important that constraints be implemented in both the DBMS and in the application for various reasons:
• DB: better documentation, safety net if application forgets to implement any constraints, DB is central and often
reused, can be used for DB-level optimization
• Application: gives meaningful error messages to the user.
4.2 Simple Constraints
1 CREATE TABLE Student
2 ( sID PRIMARY KEY , -- PRIMARY KEY implies NOT NULL by definition
3 sName text UNIQUE ,
4 GPA real NOT NULL ,
5 semester int ,
6 check ( semester > 0 AND sID > 0 AND GPA > 0)
7 ) ;
Note that check (NULL IS NOT NULL) rejects everything since the conditions evaluates to false, whereas check (NULL =
NULL) accepts everything since the condition evaluates to NULL.
One can also choose a set of attributes to be a primary key:
1 PRIMARY KEY ( sID , sName )
4.3 Keys and Foreign Keys
Declaring Foreign-Key Constraints
SQL gives us the possibility to declare an attribute of one relation to be a foreign key referencing some attributes of a
second relation. This implies the following:
⇒ referenced attributes themselves must be keys i.e. declared PRIMARY KEY or UNIQUE
⇒ either foreign key’s value is NULL or the referenced tuple must exist.
There are generally two ways to declare foreign keys:
1 attribute name REFERENCES <table > ( < attribute >) -- for single attributes as key
2 FOREIGN KEY ( < attributes >) REFERENCES <table >( < attributes >)
If this was implemented on the Internet, Error 404 would become impossible.
4.4 Maintaining Referential Integrity
In order to maintain referential integrity through database updates, insertions and deletions, we can choose between of
the following policies:
• Cascade: changes to referenced attributes are mimicked at the foreign key. (both for updates and deletions)
• Restrict: prevents deletion of the primary key in the “master” table before trying to do the change → error.
• No Action: Prevents modification after atteping the change → error. Triggers might still be executed.
• Set Default / Set Null: set references either to NULL or to a specified default value.
There is a very subtle difference between the Restrict and No Action policy that only appears in some implementations
like SQLite. It works with triggers. Certain actions can be triggered on certain events given a condition that is met.
14
1 CREATE TABLE Lecture
2 (... ,
3 PersNr integer references Professor
4 on delete cascade
5 on update set null ) ;
6 -- can choose action from { cascade , restrict , no action , set null , set default }
Summary
The following figure summarizes the maintenance of integrity constraints.
15
5 Functional Dependencies
Definition 5.1 (Functional Dependency). A functional dependency FD on a relation R is statement of the form
A1 . . . An → B1 . . . Bm
and we say that A1, . . . , An functionally determine B1, . . . , Bm. It meas that if two tuples agree on all attributes Ai then
they will agree on all attributes Bj
One can more formally write a schema as R = {A : DA, B : DB, C : DC , D : DD}. Let R be an instance of schema R and
let α, β ⊆ R. Then it holds that
α → β ⇐⇒ ∀r, s ∈ R. r.α = s.α =⇒ r.β = s.β
Note that functional dependencies have to hold for all possible instances.
5.1 Keys of Relations
Definition 5.2 (Key). We say that a set of attributes is a key for a relation R if
• those attribute functionally determine all other attributes of R
• the key is minimal =⇒ no subset of those attributes functionally determines the other attributes.
A key consisting of a single attribute A is often denoted as A rather than using set notation {A}.
Definition 5.3 (Superkey). A set of attributes that contains a key is called a superkey.
Notation
In the lecture we use the following notation for keys:
• α ⊆ R is superkey iff α → R
• α → β is minimal iff ∀A ∈ α. ¬ ((α − {A}) → β) and we denote minimal functional dependencies by α →· β
• α ⊆ R is a key iff α →· R
5.2 Rules about Functional Dependencies
Let αγ := α ∪ γ. Then we have the following axioms for inferring functional dependencies:
Theorem 5.1. The following are the Armstrong Axioms for the inference of FDs. They are complete.
• Reflexivity: β ⊆ α =⇒ α → β
• Augmentation: α → β =⇒ αγ → βγ
• Transitivity: α → β ∧ β → γ =⇒ α → γ
The following rules can be derived from them:
Theorem 5.2 (Inference Rules). • Union: α → β ∧ α → γ =⇒ α → βγ
• Decomposition: α → βγ =⇒ α → β ∧ α → γ
• Pseudo Transitivity: α → β wedge γβ → δ =⇒ αγ → δ
Closure of Attributes
The following presents an algorithm that takes as input a set of FDs F and a set of attributes α and returns a set of
attributes α+ such that α → α+.
The algorithm proceeds in 4 steps:
1. Split all FDs such that they only contain a single attribute on the right side.
2. Let α+ ← α to begin with
3. Repeatedly search for a FD β → γ such that β ⊆ α+ and γ /∈ α+. Add γ: α+ ← α + ∪{γ}.
4. At some point, nothing more can be added to α+ =⇒ return.
Note that this algorithm makes it possible to test whether any given FD α → β follows from a set of FDs F.
16
Minimal Basis
Definition 5.4 (Minimal Basis). A minimal basis for a set of FDs F is a basis F c that satisfies the following conditions:
1. F c ≡ F meaning the ”closure of all attributes”-set is the same in F c and F
2. all functional dependencies are minimal:
• ∀A ∈ α : (F c − (α → β) ∪ ((α − {A}) → β)) 6≡ F c
• ∀B ∈ β : (F c − (α → β) ∪ (α → (β − {B}))) 6≡ F c
This means that if any FD is removed, the result is no longer a basis.
3. in F c there are no two functional dependencies with the same left side
The minimum basis can then be computed in 3 steps. Let therefore α → β ∈ F, A ∈ α, B ∈ β:
1. Reduce left sides of FDs: if β ⊆ Closure(F, α − A) then replace the FD with (α − A) → β in F
2. Reduce right sides of FDs: if B ∈ Closure(F − (α → β)∪(α → (β − B)), α), then replace the FD with α → (β − B)
in F.
3. Clean up: Remove FDs with empty right sides and apply union rule to FDs with same left side.
5.3 Design of Relational Database Schemas
Anomalies
Anomalies are problems that arise when we try to cram too much into a single relation:
• Redundancy: unnecessary repetition in several tuples
• Update Anomalies: changing information in one tuple might leave same information unchanged in other tuple
• Deletion Anomalies: deletion of a set of values leads to loss of other information as side effect that is not desired
Decomposing Relations into BCNF
Idea: Split the attributes of R to make the schemas of two new relations. Note that some attributes can (and must) appear
in both the new relations.
Definition 5.5 (BCNF: Boyce-Codd Normal Form). Let F be the set of FDs for R.
R is in BCNF ⇐⇒ if α → β ∈ F non-trivial, then α is superkey for R.
Note: This means that every two-attribute relation is in BCNF.
Decomposing Relations into BCNF works as follows:
1. Look for a FD that violates BCNF =⇒ add to the right side all possible attributes that are functionally (nontrivially) determined by the left side.
2. Let A, B be the attributes on the left and right side, respectively. Then we split the relation into two pats as follows:
Others stands for all attributes in the relation appearing on neither side.
Repeat this for all relations that are created like this, until all are in BCNF form. Note that this includes the computation
for the sets of FDs for the new relations.
=⇒ Any schema can be decomposed losslessly into BCNF, however, the preseveration of dependencies cannot be
guaranteed.
17
5.4 Decomposition
We want three distinct properties:
• Elimination of Anomalies
• Recoverability of Information: original relation must be restorable
• Preservation of Dependencies:
Recovering Information
Definition 5.6 (Lossless Decomposition). We say a decomposition of R into R1, . . . , Rn is lossless if
R = R1 ./ . . . ./ Rn
Let R = R1 ∪ R2 where the latter two are projections of some columns.
Lemma 5.1. The decomposition of R is lossless if either (R1 ∩ R2) → R1 or (R1 ∩ R2) → R2
Preservation of Dependencies
Definition 5.7 (Dependency Preservation).
FD(R)+ = (FD(R1) ∪ · · · ∪ FD(Rn)) +
The problem often arises, when tuples are inserted: Inconsistent tuples may be inserted in one of the new relations. When
joining afterwards, some functional dependencies may not hold anymore. This problem can arise when transforming to
BCNF: The decomposition is lossless but not dependency-preserving.
18
6 Normal Forms
To prevent data redundancy and anomalies, we introduce some normal forms to restructure relational databases. They
build a hierarchy where higher NFs build upon lower NFs. The BCNF is also part of this hierarchy.
6.1 First Normal Form
The first NF simply demands every attribute to be atomic.
6.2 Second Normal Form
R is in 2NF ⇐⇒ ever non-key attribute is minimally dependent on every key and R is in 1NF.
Resolving Violations - ER Modelling
• When an entity is mixed with an N : M or a 1 : N relationship, this violates 2NF =⇒ separate entity and
relationship e.g. by implementing them in different relations
• it is okay to mix entities with 1 : 1 or N : 1 relationship
6.3 Third Normal Form
R is in 3NF ⇐⇒ R is in 2NF and ∀α → B ∈ R at least one of the following conditions hold:
• B ∈ α, i.e. the FD is trivial.
• B is an attribute of at least one key.
• α is a superkey of R
If α → B does not fulfill any of these conditions, α is a concept in its own right. Note that 1NF and 2NF are not commonly
used in modern DBMS.
An attribute that is member of some key is said to be prime.
Resolving Violations - ER Modelling
When mixing several entities that are possibly connected by relationships, the relation may violate 3NF. The solution is
to implement each entity in a separate relation and to implement N : M relationships in separate relation.
The Synthesis Algorithm
The following algorithm allows us to decompose a relation R into a set of relations such that all the relations in the
decomposition are in 3NF and the decomposition is both lossless and dependency-preserving:
• Input: relation R and a set of FDs F that hold for R
• Output: decomposition of R into collection of relations with the above properties
The algorithm proceeds by the following steps:
1. Find a minimal basis G for F
2. for each FD α → β ∈ G, create a relation R(α ∪ β)
3. For key κ ⊆ R create a relation Rκ
4. Remove relations that are fully contained in other relations (except for the key relation)
6.4 BCNF
R ∈ BCNF =⇒ R ∈ 3NF. It thus follows immediately that any schema can be decomposed losslessly into 3NF. We have
already looked at the decomposition algorithm in Section 5.
6.5 Multivalued Dependencies
Common source of redundancy in BCNF schemas occur when we put 2+ set-valued properties of the key into a single
relation → doesn’t violate BCNF condition. This leads to the introduction of a new concept:
19
Definition 6.1 (Multi-valued Dependency). A multivalued dependency MVD
A1 . . . An  B1 . . . Bm
holds for a relation R if when we restrict ourselves to the tuples of R that have particular values for all attributes A,
then the set of values for all the attributes B is independent of the values in the set of all attributes of R that are neither
in A nor in B.
One can more formally state the above definition as follows:
Definition 6.2 (Multi-valued Dependency v2). A MVD holds if for each pair of tuples t, u of relation R that agree
on all A’s, we can find in R some tuple v that agrees:
• with both t and u on the A’s
• with t on the B’s
• with u on all attributes of R neither in A nor B
Interchanging t and u infers the existence of a fourth tuple w that agrees with u on the B’s and with t on the other
attributes
Theorem 6.1 (Lossless Decomposition). Let R := R1 ∪ R2 where R1,2 are projections on R. Then the following
equivalence holds:
The decomposition is lossless ⇐⇒ (R1 ∩ R2)  R1 or (R1 ∩ R2)  R2
The Laws of MVDs
The trivial MVDs rule and the transitive rule hold similarly to the FD rules. Note however that splitting/combining rules
do not hold.
Theorem 6.2 (Other MVD rules). The following rules holds for MVDs:
• FD Promotion: α → β =⇒ α  β. The converse is not always true.
• Complementation: α  β =⇒ α  γ for γ := R − α − β
• Multi-value Augmentation: α  β ∧ (δ ⊆ γ) =⇒ αγ  βδ
• Coalesce: α  β ∧ (γ ⊆ β) ∧ (δ ∩ β = ∅) ∧ δ → γ =⇒ α → γ
• Multi-value Union: α  β ∧ α  γ =⇒ α  βγ
• Intersection: α  β ∧ α  γ =⇒ α  (β ∩ γ)
• Minus: α  β ∧ α  γ =⇒ α  (β − γ) ∧ α  (γ − β)
Note: an MVD α  β is trivial ⇐⇒ β ⊆ α or β = R − α
6.6 Fourth Normal Form
Definition 6.3 (4NF). R is in 4NF ⇐⇒ for all MVDs α  β at least one of the following holds:
1. α  β is trivial
2. α is a superkey of R
Note that this implies that whenever a relation is in 4NF, it is also in BCNF. A BCNF violation is also a violation of 4NF.
Decomposition Algorithm
Works similarly to the BCNF decomposition algorithm. Let R be a relation that is not in 4NF yet. Let S0 be a set of
FDs and MVDs. The algorithm proceeds in the following steps:
1. Find a 4NF violation in R. This is either a true MVD, or the corresponding MVD can be derived via the promotion
rule. Let this rule be α  β
2. break the schema of R into to schemas: R1 consists of attributes α ∪ β. R2 consists of attributes R − β.
3. Recursively find FDs and MVDs that hold in the new schemas and decompose until all relations are in 4NF.
20
6.7 Normal Forms Comparison
As stated earlier, the Normal Forms build a hierarchy. Note that NF1 and NF2 are rarely used in DMBS these days.
Important are the following two points:
• lossless decomposition is possible up to 4NF
• preserving dependencies is possible up to 3NF
21
7 Schemas
A database schema captures concepts to be represented with their attributes and their constraints and dependencies on
each other. We can now distinguish different important type of schemas that serve different type of workloads:
7.1 OLTP: Online Transaction Processing
Refers to workloads where updates to the database of all kinds are possible. The workloads often have the following
properties:
• they are online =⇒ some guarantees on reponse time are required.
• they come in high volumes but the transactions themselves are usually very small, meaning only few records are
returned
• Integrity is important since there are different users.
Examples of such database systems are e-banking, online shopping etc.
7.2 OLAP: Online Analytical Processing
This type of schema is generally used for reporting and analysis of collected data. Workloads often have the following
properties:
• queries are heavy and very complex. Data might be updated, but this typically happens in batches.
• OLAP workloads typically use denormalized schemas for performance reasons such as star or snowflakes schemas
or data cubes for data-mining.
Note that one often uses OLTP for Business Operations and aggregates this data into a OLAP schema for Business
Analysis.
Star Schema
One central fact table and multiple dimension tables that further detail the described fact from the fact table. Both fact
and dimension tables are denormalized.
Denormalized Schemas would normally lead to data redundancy and thus to anomalies. This is however prevented by
the way those databases are updated: A OLAP database is not populated by hand or by individual transactions. Rather,
one uses periodic batches to update the databse =⇒ during the data loading process the constraints and anomalies are
controlled =⇒ application that does the load is responsible, not the schema.
Snowflake Schema
In a snowflake schema the dimension tables are normalized (some or all of them). The normalization is applied to
low-cardinality attributes to remove redundancy.
Data Cubes
Data Cubes are mainly used for data analysis and reproting =⇒ include pre-aggregated data across several dimensions
and granularities that can be
• sliced: select over one dimension (e.g. sales of a single product by year and region)
• diced: selection over dimension of the original cube (e.g. sales over a period of time from a range of products within
a particular region)
• drilled up/down: group-by at different granularities (e.g. sales by shop, sales by product etc.)
• rolled up: aggregation along a dimension (e.g. sales by week)
7.3 Modern trends for Database schemas
Combining OLTP and OLAP in one system, having entire databases stored in main memory, column stores at the physical
design level and denormalization for heavily specific applications.
7.4 Example: The TPC schema
Omitted.
22
8 Database Systems
A modern database system looks roughly like this. It needs to translate an SQL query
into a set of get/put request to backend storage, which returns a block that must
be extracted, processed and then transformed into tuples. What the DBMS returns
is a set of tuples. Behind that layer of abstractions, that are various optimization
strategies that take place, some of them which we will look into in the remaining
chapters. Further, there are security layers, durability optimization and concurrency
control that happen behind that abstraction layer as well.
8.1 Memory Hierarchies
Problem is always bringing the data to the CPU → bottleneck has nowadays moved,
many current databases still operate under the assumption that the data is stored on disk, however today we assume data
in main memory.
=⇒ same issue: sequential accesses are a lot more efficient (due to caching and hardware prefetching etc.) whereas
random accesses pollute the cache and are unpredictable.
8.2 Storage Systems
Storage is usually organized hierarchically, often in a distributed manner =⇒ can use cheap hardware, parallel accesses
and increased bandwith lead to good performance. Further, the system now is more fault tolerant since data is replicated
many times.
Storage Manager
• controls all accesses to external storage & implements the external hierarchy
• manages files and blocks
• manages the buffer (segmentation of buffer pool, choosing and implementing the replacement policy, and pin pages)
Multicore Systems
Cache hierarchy requires to place data very carefully, since multicore architectures introduce several NUMA effects, since
the distance between cores might not be the same and some cores share memory while others don’t etc. Random access
to DRAM is very expensive.
8.3 Storing Data
Records tuples
Pages collection of tuples of the same table
Blocks parts or collections of pages
Tablespaces space for a database on a disk
Files files on disk
The above table introduces the notation of the hierarchical system to store our databases.The file manager maps records
to pages. The buffer manager maps pages in memory to blocks on disk. The Catalog keeps track of where things are.
Note: this notation is system specific, e.g. Oracle uses different notation.
Structure of a Record
A record can contain both fixed and variable-length fields, e.g. a date is of fixed size whereas a varchar[100] is of
variable size. Records can either be stored either way:
• Fixed length: information about field types can be stored elsewhere → i-th field always takes same amount of
space =⇒ store in system catalogue. This enables a direct access without scanning the record.
• Variable length: we have two choices:
i. store a field count and denote end of a field with a special symbol
ii. first store an array of field offsets and then directly thereafter the fields themselves. =⇒ offers direct access
to some i-th field, allows efficient storage of NULLs. Preferred way.
23
Structure of a Page
Inside a page there is a record identifier (rid) consisting of <pageno, slotno> for every record. The indexes use rids to
reference records. Within a page, this allows us to record the position, namely the record starts at byte slotno × bytes
per slot. =⇒ allows records to move within page without updating the indexes, only the slotno needs to be changed.
Variable-Length Records: Slotted Page Structure
Slot Directory contains the number of records, the end of free space in the block and the location and size of each record
=⇒ external tuple pointer point to the record pointers.
When a page is full an e.g. a record grows =⇒ keep a placeholder (TID), move record to different page and keep a
forward (TID) at the home page. =⇒ expensive: 2 IO accesses, but flexible: no need to update references
Database
A file is a variable-sized sequence of blocks, where blocks are the unit of transfer to and from disk. A page is a fixed size
sequence of blocks. There is one header page, the rest are data pages. Each page contains two pointers to the previous
and the next page. The header page points to a a sequence of full and to a sequence of empty pages.
A directory is a collection of pages. Directory entries include the amount of free bytes on the page.
8.4 Buffer Management
Goal: keep page in memory as long as possible → have to choose replacement policy, e.g. LRU, Clock, 2Q etc. The data
must be in DRAM for the DMBS to operate on it.
Database System vs. Operating System
DBMS knows access patterns better than the OS =⇒ can make better decisions on which pages to keep in main memory
and which not. There are certain problems that can arise:
Example: Assume DMBS needs a page X that is not in the DB buffer pool. Then the DBMS first evicts another
page Y to make room for X. However, the OS did not cache page Y , so it interrupts the DBMS an reads page Y
from disk. Then Y logically evicts it from its buffer pool and lets the OS read page X from disk. =⇒ at least 2
I/Os.
Replacement Policies
• LRU: replaces frame with earliest timestamp =⇒ problematic with sequential flooding
• MRU: replaces newest frame when buffer is full =⇒ good for sequential flooding
DBmin
One can also segment the buffer: Each query consists of set of operators → allocate memory in the buffer for each of the
operators and adjust its replacement policy according to the access pattern, which the DBMS knows (e.g. MRU for a
linear scan) etc.
8.5 Catalog: Managing Metadata
Meta-data is stored in tables and is accessed internally using SQL. Examples: Schema, table spaces, histograms, paramters
like I/O cost and CPU speed (for optimization), precompiled queries, users etc.
24
9 Query Processing
The compiler parses SQL into a query graph model which is then rewritten, optimized, and then turned into code, which
is given to the interpreter in the runtime system. The latter has three choices:
• compile query into machine code =⇒ better performance
• compile query into relational algebra & interpret that =⇒ better portability, easier debugging
• hybrid → combine the 2 approaches e.g. by compiling predicates into machine code
The query interpreter provides an implementation for each algebra operator and defines interfaces between them.
• Query Selectivity: # tuples returned vs # tuples in table
• Attribute Cardinality: # of distinct possible values for an attribute
• Skew: probability distribution of the values of an attribute.
9.1 Scans
Iterate over every tuple in a table → match tuple against predicate. Not that slow due to predictability. Can use indexes
like Hash Tables, B+ Trees to avoid full table scans.
B+ Trees
• the keys in leaf nodes are copies of keys from data file → distributed among the leaves in sorted order
• at leaves, last pointer points to next leaf, first pointer points to first leaf, other pointers point to the data records
• design choice: one can also store pointer to data records at intermediate levels, or only at leaves.
=⇒ use indexes on keys and attributes with high cardinality or attributes frequently used in joins. B+ Trees allow
for index range scans!.
Clustered Index: leaf nodes contain the data instead of pointer.
Selectivity of Indexes
Let c := cardinality of attribute and r := number of records in table. Then the selectivity s of an index can be calculated
by
s =
100 · c
r
Note that predictability is more important than raw performance of indexes these days. Indexes give good performance if
queries hit the index and the selectivity is high, however, they need maintenance and take up a lot of space.
9.2 Sorting
Sorting is important as intermediate step for join, group-by, max etc. =⇒ very expensive both in time and space.
2-Phase External Sorting
Let n := size of input in pages and m := size of buffer in pages. Proceed in 2 steps:
1. Create Runs: load batch of tuples into buffer, sort, write back to disk, process next run
2. Merge Runs: use priority heap to merge tuples from runs. If m < √
n, then we need multiple merge phases
This is a one-pass algorithm. If there are too many runs, the IO overhead is too high. =⇒ use multi-way merge.
Analysis
Let n := size of table in pages and m := size of available memory in pages.
• IO Cost =



O(n) if m ≥
√
n where (
2N if m ≥ n
4N if m < n
O(n · logm n) if m < √
n
• CPU cost in Phase1: O(n · log2m) and in Phase2: O(n · log2n/m) to merge n tuples
25
9.3 Joins
Joins are one of the most common operations in databases.
Nested Loop Joins
works in O(|R| · |S|), check every tuple in R against every tuple in S with two nested loops. Still used in practice, e.g.
when S is sorted =⇒ sort merge join. Can be optimized using the blocking technique.
Canonical Hash Join
Has a complexity of O(|R|+|S|) and is parallelizable and makes sense if R is much smaller than S and R fits into memory.
Proceeds in two steps:
1. Build Phase: Apply hash function to both tables
2. Probe Phase: search for matches in the hash table.
Grace Hash Join
Apply the hash-function to all tuples in relation R and S. Then Build and Probe on
the partitions that were created. This is possible since Ri ./ Sj = ∅ since tuples would
match to the same partition number if they were equal in the hashed attribute.
Partitioned Hash Join
Goal: no more cache misses during join =⇒ partition input into p disjoint chunks of
cache size. Do joins on these chunks.
Problem: if p is too large, there are TLB misses or even cache trashing.
Multi-Pass Radix Partitioning
Do partitioning in multiple passes i.e. i = logT P passes to get T
i partitions that fit into the cache. This is very TLB and
cache efficient and thus compensates for the overhead in read/write passes that this method incurs.
Parallel Radix Join
9.4 Hashing vs. Sorting
Both can be used for binary and unary matching problems that occur in joins, group-by etc. Their asymptotic complexity
is O(n log n) in botch CPU and IO, although hashing has lower constants in CPU complexity. The main difference is, that
the merging is done afterwards but the partitioning is done before and partitioning depends on good statistics. Sorting is
more robust, Hashing is better in average case.
9.5 Group-By
Can either hash on the group-by attribute and then aggregate on all hash collisions, or sort on the group-by attribute and
then aggregate on the sorted ranges.
26
10 Query Optimization
Idea: Query is translated into a plan which is a tree of operators → each operator can be implemented in different (provably
equivalent) ways. Choose most efficient one.
10.1 Execution Models
Iterator Model - tuplewise Execution
Pipeline execution of the tree, each operator implemented independently by the iterator.
Interface: open(), next(), close(). open()/close() at top of tree results in a cascade of opens/closes down the tree.
An operator getting a next() call may recursively make next() calls from within.
Typical Dataflow operators include:
• Union (with or without duplicates) → issue all sides or check against all tuples for duplicates
• Select → read until a tuple meets predicate.
• Project → read tuple, output only specified attributes, read next tuple
• Join → nested loop
• Join with index (on inner relation) → ∀t ∈ R : fetch matching tuple in S
Data flows bottom up in a plan, control flows top down.
+ generic interface: information hiding, easy to implement, no memory overheads, supports buffer management strategies, supports pipelining which is great if only subset of results is consumed, supports parallelism
- high overhead for method calls, poor instruction cache locality
Other Models
Today, one more often uses Vectorized models that operate on blocks rather than single tuples.
10.2 Choosing Operators
Group Nr. Name
Normal Selection A1 Linear Scan
A2 Binary Search
Selection using Indexes
A3 Primary Index on kandidate key, equality
A4 Primary index on non-key, equality
A5 Equality on search-key of secondary index
Selection with comparisons A6 Primary index, comparison
A7 Secondary Index, comparison
Complex Selections
A8 Conjunctive selection using one index
A9 Conjuntive selection on multiple-key index
A10 Conjunctive Selection by intersection of identifiers
A11 Disjunctive selection by union of identifiers
One can also have a selection from a negation: σ¬θ(r) → use linear scan on file or check if an index is applicable to θ and
find satisfying records like that.
10.3 Equivalence Rules
We first cover some special rules:
Theorem 10.1. The selection operation distributes over theta-join under following two conditions:
(a) when all attributes in θ0 involve only attributes of one of the expressions (E1) being joined:
σθ0
(E1 ./θ E2) = (σθ0
(E1)) ./θ E2
27
(b) when θ1 involves only the attributes of E1 and θ2 involves only attributes of E2:
σθ1∧θ2
(E1 ./θ E2) = (σθ1
(E1)) ./θ (σθ2
(E2))
Theorem 10.2. The projections operation distributes over the theta join operation as follows:
(a) if θ only involves attributes from L1 ∪ L2:
Y
L1∪L2
(E1 ./θ E2) = (Y
L1
(E1)) ./θ (
Y
L2
(E2))
(b) Let L1, L2 be sets of attributes from E1, E2, respectively. Let further L3, L4 be attributes from E1, E2, respectively,
that are involved in the join condition θ but are not in L1 ∪ L2. Then:
Y
L1∪L2
(E1 ./θ E2) = Y
L1∪L2
(( Y
L1∪L3
(E1)) ./θ (
Y
L2∪L4
(E2)))
The rules denoted in the following table can always be applied: ** θ2 involves attributes from only E2 and E3
Deconstructing Conjunctive Selections σθ1∧θ2
(E) = σθ1
(σθ2
(E))
Commutativity of Selection σθ1
(σtheta2
(E)) = σθ2
(σθ1
(E))
Last Projection Q
t1
(
Q
t2
(. . .(
Q
tn
(E)). . .)) = Q
t1
(E)
Selection and Cartesian Product σθ(E1 × E2) = E1 ./θ E2
Selection and Theta Joins σθ1
(E1 ./θ2 E2) = E1 ./θ1∧θ2 E2
Theta/Natural Joins Commutativity E1 ./θ E2 = E2 ./θ E1
Natural Join - Associativity (E1 ./ E2) ./ E3 = E1 ./ (E2 ./ E3)
Theta Join - Associativity (E1 ./θ1 E2) ./θ2∧θ3 E3 = E1 ./θ2∧θ3
(E2 ./θ2 E3) **
Set Operations - Commutativity E1 ∪ E2 = E2 ∪ E1 and E1 ∩ E2 = E2 ∩ E1
Set Operations - Associativity (E1 ∪ E2) ∪ E3 = E1 ∪ (E2 ∪ E3) and (E1 ∩ E2) ∩ E3 = E1 ∩ (E2 ∩ E3)
Projection Distributes over Union Q
L
(E1 ∪ E2) = (Q
L
(E1)) ∪ (
Q
L
(E2))
General Advice
Early selections and predicate pushdown allows us to earlier determine which tuples are really necessary =⇒ less tuples
need to be manipulated higher up the operation tree. =⇒ unnesting of views.
10.4 Query Enumeration
Idea: enumerate all possible plans, assume some cost model =⇒ consider each available access path, choose the one with
least estimated cost.
Problem: Query optimization is NP-hard. → can use dynamic programming or some heuristics to get good execution
plans.
DP Algorithm
28
11 Transaction Processing
Definition 11.1 (Transaction). A transaction is a sequence of reads and writes over a database that either commits
or aborts.
• Commit: transaction completed, database confirms to client when all changes have been made persistent
• Abort: transaction cancelled, undo all changes.
• a <T b: a happens before b
We assume the following basic things:
• transactions are delimited by begin operation and a abort/commit operation and are correct programs
• operations within transaction are totally ordered with respect to each other
• communication happens only through writes and reads
11.1 ACID Principle
• Atomicity: either execute transaction entirely or not at all
• Consistency: entire transaction execution → consistent database
• Isolation: transaction executes as if it were alone
• Durability: committed changes of transaction are never lost → recoverable
11.1.1 Transaction Management
• Concurrency Control: enforcing isolation among concurrently running transactions
• Recovery: ensuring durability and atomicity of transaction
11.2 Schedules & Serializability
A huge DBMS often runs hundreds of transactions concurrently, so the correctness/isolation principle, which states that
a transaction is executed in isolation will transform a consistent state into a new consistent state, does not apply here.
For that reason, we introduce some new concepts that allow us to reason about concurrent transactions.
Definition 11.2 (Schedule). A schedule is a sequence of important actions taken by one or more transactions. We
assume that reads and writes take place in main-memory buffers, not on disk.
Definition 11.3 (Serial Schedule). A schedule is serial if its actions consist of all actions of one transaction followed
by all actions of another transaction and so on.
Instead of listing all actions, we often denote serial schedules by a list of the transactions, e.g. (T1, T2).
Definition 11.4 (Serializable Schedule). A schedule S is serializable if there is a serial schedule S
0
such that for
every initial database state, the effects of S and S
0 are the same.
The details of a transaction matter for this property. Yet, it is unrealistic to require the scheduler to concern itself with
the computation details, and thus, we make the following assumption:
Any database element A that a transaction T writes is given a value that depends on the database state in such
a way that no arithmetic coincidences occur.
=⇒ if there is something that T can do to a database element to make the state inconsistent, T will do that.
Definition 11.5 (Notation). Let rT (X), wT (X) denote reads/writes to X by transaction T.
• an action is expression of form ri(X) or wi(X).
• a transaction Ti
is a sequence of actions with subscript i.
• a schedule S is a set of transactions T is a sequence of actions, in which for each Ti ∈ T the actions of Ti appear in
S in the same order as in Ti
itself. S is an interleaving of the actions of the transactions of which it is composed.
29
11.3 Conflict-Serializability
Recall the definition of a serializable schedule: To show that S is serializable, one needs to show that there exists a serial
schedule S
0
such that for any initial state, the effects of S and S
0 are the same.
There exists no trivial way to find such a schedule, in fact the problem is NP-complete. Thus, we derive a strong condition
that is easier to prove.
11.3.1 Conflicts
• two actions of the same transaction always conflict (cannot be reordered by definition).
• two writes of different transaction to the same element conflict, e.g. wi(X) and wj (X).
• a read and a write of the same element by different transactions, e.g. wi(X) and rj (X) (and vice versa).
=⇒ any two actions from different transactions can be swapped unless they involve the same database element and at
least one is a write.
Transactions might abort, and this abort action also leads to conflicts in the following manner:
• ri(X) and aj conflict if Tj updated element X before aborting
• wi(X) and aj conflict if Tj updated element X before aborting
Such conflicts do not occur with commit actions.
11.3.2 Conflict Equivalence and Serializability
Definition 11.6 (Conflict Equivalence). Two schedules are conflict equivalent if they can be turned one into the
other by a sequence of non-conflicting swaps of adjacent actions.
Definition 11.7 (Conflict Serializable Schedule). A schedule is conflict serializable if it is conflict-equivalent to a
serial schedule.
Lemma 11.1. conflict serializable =⇒ serializable BUT: serializable =6⇒ conflict serializable
11.3.3 Checking Conflict Serializability
A pair of conflicting actions put constraints on the order of transactions, since these actions must never be swapped. Let
C be the set of constraints induced by the schedule’s conflicting actions. If C is contradictory, then the schedule is not
conflict-serializable, however, if C is non-contradictory, then the schedule is conflict-serializable.
Definition 11.8 (Precedence on Transactions). Given schedule S and transactions T1, T2, we say that T1 takes
precedence over T2, denoted T1 <S T2 if there are actions A1, A2 of T1, T2, respectively, such that A1 precedes A2 in the
schedule and A1, A2 are conflicting.
Consider a set of n transactions T1, . . . , Tn that appear in a schedule S. We want to determine whether S is conflict
serializable or not. =⇒ build a precedence graph for S, the nodes being the transactions Ti
. There is a directed edge
from node i to j if Ti <S Tj . Now for this graph G = (V, A), the following theorem tells us whether the schedule is
conflict-serializable or not.
Theorem 11.1. Schedule S is conflict-serializable ⇐⇒ the precedence graph G = (V, A) for S is acylic.
Note that this means that any topological order of the nodes is a conflict-equivalent serial order.
11.3.4 Notion of Time
Note that concurrency control does not imply a time order, the ordering of concurrency control is often not the same as
the time ordering. The ultimate goal is to find a way to execute operations in parallel while insuring the result is correct.
This does only imply that one needs to respect the order established within a transaction, but it does not imply that one
needs to respect the time order of operations of different transactions.
11.4 Enforcing Serializability
There are two general approaches to enforce serializability. In a pessimistic setting, one always considers the worst case
for every single action whereas in an optimistic setting, one deals with conflicts only when they occur. We first consider
the pessimistic approach.
30
11.5 Locking
In an ideal setting, a scheduler would forward a request if and only if its execution cannot possibly lead to an inconsistent
database state after all active transactions commit or abort. When a scheduler uses locks, transactions must request and
release locks in addition to reading/writing database elements. There are 2 properties that are required for the lock use
to be proper, namely the consistency of transactions and the legality of schedules. A third very interesting property comes
with two-phase locking:
Theorem 11.2 (2PL). A legal schedule of consistent transactions is conflict-serializable if in every transaction, all lock
actions precede all unlock actions.
A transaction that obeys the 2PL condition is called a 2PL transaction.
11.5.1 Shared and Exclusive Locks
Writing requires a stronger lock than simply reading =⇒ introduce two kinds of locks:
• Shared/Read Lock: must be held to read the locked element
• Exclusive/Write Lock: must be held to write the locked element, also allows to read it.
For any database element X there can either be one exclusive lock on X or an arbitrary amount of shared locks on X.
The three properties are summarized in the following theorem:
Theorem 11.3.
1. Consistency of transactions: transactions cannot write without holding an exclusive lock and cannot read without
holding some lock. All locks must be followed by an unlock of the same element.
2. Two-Phase Locking: Locking must precede unlocking.
3. Legality of Schedules: Elements may either be locked exclusively by one transaction or by several in shared mode,
but not both.
Note that this allows a transaction to hold both a shared and an exclusive lock on the same property, as is desired if the
need for locks cannot be predicted.
Let sli(X) denote the request of Transaction Ti for the shared lock of X. Let xli(X) be defined analogously for the
exclusive lock. Let ui(X) denote that Ti releases whatever lock(s) it holds for X. Then, Theorem 11.3 can be restated
more formally as
Theorem 11.4.
(1.a) read action ri(X) must be preceded by sli(X) or xli(X) with no intervening ui(X)
(1.b) write action wi(X) must be preceded by xli(X) with no intervening ui(X)
(2.) in any 2PL transaction Ti
, no action sli(X) or xli(X) can be preceded by an action ui(Y ) for any Y
(3.a) xli(X) appears in schedule =⇒ cannot be a following xlj (X) or slj (X) for some j 6= i without intervening ui(X)
(3.b) sli(X) appears in schedule =⇒ cannot be a following xlj (X) for some j 6= i without intervening ui(X)
The Shared and Exclusive Lock mode can be described by its compatibility matrix :
No Lock Shared Exclusive
Shared Y Y N
Exclusive Y N N
Note that we require the DB to implement these locks and cannot rely on the hardware to do this in more efficient fashion,
since the DB knows the semantics of the operations, whereas the OS needs to treat the ops as a “black box”.
We allow lock upgrades, i.e. if a Transaction holds a shared lock on some element X, it can request an exclusive lock
directly, without first releasing the shared lock. The scheduler’s decision to grant access or not can be read from the
compatibility matrix.
11.5.2 Strict 2-Phase Locking
A problem that arises with 2-phase locking is that, if a transaction T1 writes some element A that Transaction T2 later
reads (due to the locking mechanism) and then T1 aborts, this leads to T2 needing to abort to. In a nested situation, if
the an inner transaction aborts, then all outer transactions must abort as well. In order to avoid this, we impose a stricter
condition, called strict 2-phase locking:
31
Definition 11.9 (Strict 2-Phase Locking). A transaction is strictly 2-phase locked (S2PL) if it is 2PL and all locks
are released only at the end of transaction, i.e. directly before commit/abort.
This avoids rolling back transactions that already committed =⇒ Simple 2-Phase locking does not implement
ACID properly!. Further, Strict 2PL couples visibility with recoverability.
11.5.3 Deadlocks
Can occur naturally since we are using locks. → draw a wait-for graph. There exists a deadlock if and only if the wait-for
graph contains a cycle. Now one can choose a transaction that is contained in a cycle and kill it, to resolve a cycle. Which
transaction to kill is dependent on the implementation, but one can consider the following list:
age → progress → # items locked → how many deadlocks can it break? → # rollbacks → # times the
transaction was aborted
11.5.4 Deadlock Prevention
A simple strategy to prevent deadlocks in transactions is the following:
• old transactions wait for younger ones.
• restart young transaction when they require old one
11.6 Granularity of Locks & Hierarchical Locking
• less locks =⇒ less control but almost no concurrency
• more locks =⇒ high data and control overhead, but high concurrency
Sometimes useful to have both fine-grained locks for common operations but also coarse-grained for entire relation, e.g.
to check whether there is still the correct amount of money in the bank. =⇒ coarse-grained lock in the presence of
fine-grained locks is problematic.
11.6.1 Intention Locks
We assume that relations are the largest lockable elements and consist of multiple blocks, each containing of multiple tuples.
If a node is in intention mode, explicit locking is being done at a lower level level in the tree. The idea can be combined
with update locks. Before we look at the locking mechanism, depicted is the compability matrix. Note that this matrix
only applies to requests for other transactions not holding the current lock.
IS S U IX SIX X
IS Y Y Y Y Y N
S Y Y Y N N N
U Y Y N N N N
IX Y N N N N N
SIX Y N N N N N
X N N N N N N
• IS: some lower node is in Shared
• IX: some lower node is in Exclusive
• SIX: root is locked in Shared, some lower node is in Exclusive, actually just holding both S and IX at the same
time.
Whenever one needs to lock something, one starts from the root and takes the path to the corresponding leaf. If we are
directly at the element we want to lock, we can use either S or X. Otherwise, we place a warning at this node IX or IS,
depending on whether we want a shared or exclusive lock on the subelement.
11.6.2 Phantoms
With the above scheme, insertions can become problematic, since one would need to lock elements that did not yet exist
at the time the locks were taken. =⇒ there could be phantom tuples, tuples that should have been locked but weren’t
that lead to inconsistencies.
Solution: When inserting or deleting tuples, we need to lock the entire relation.
32
11.7 Snapshot Isolation
Snapshot Isolation is an optimistic way to enforce serializability. When a transaction T starts it receives a timestamp tT .
• all reads are carried out at “picture” of DB at time tT =⇒ need historic versions of all objects
• all writes carried out to separate buffers, visible after commit only
When a Transaction T1 commits, check for any conflicts, that is
Abort T1 with timestamp t1 if there exists another transaction T2 such that
• T1 and T2 updated the same object and
• T2 committed after t1 but before T1 committed
+ allows more concurrency and availability, no phantoms
+ no deadlocks, efficient way to implement aborts
– overhead for keeping write-set of a TA and keeping all versions of an object → useful anyway in many situations
– unnecessary rollbacks
– Write Skew: 2 concurrent transactions might update different objects independently, each update being okay, but
the combination is not. This is not solvable in snapshot isolation, since integrity constraint checking also happens
in the snapshot.
11.8 Recovery Theory
There are 4 different recovery scenarios that we can distinguish:
R1: undo a single transaction upon abort by the application or system
R2: redo committed transactions upon system crash
R3: undo active transactions upon system crash
R4: read backup of DB from tape upon system crash with loss of disks
11.8.1 Recovery on Histories
TA T1 reads from another TA T2 if T1 reads a value written by T2 at a time when T2 was not aborted.
Definition 11.10 (Recoverable History). A history H is recoverable if the following implication holds:
Ti reads from Tj and commits =⇒ cj <H ci
This means that there is no need to undo a committed transaction.
Definition 11.11 (Avoids-Cascading-Aborts History). A history H is ACA if the following implication holds:
Ti reads from Tj =⇒ cj <h ri(X)
This means that an aborting transaction does not cause aborting others.
Definition 11.12 (Strict History). A history H is strict if the following implication holds:
Ti reads from or overwrites a value written by Tj =⇒ cj <H ri(X) / wI (X) ∨ aj <H ri(X) / wi(X)
This means that undoing a transaction does not undo changes of other transactions.
These properties and their connection can be summarized by the following figure.
33
12 Recovery
A DMBS should be resilient, i.e. integrity of data should be guaranteed even in the face of system failure. Data must no
be corrupted at any point in time simply because multiple queries are executed at once.
12.1 Issues & Models for Resilient Operations
We list the most important failure modes and what a DBMS can do about them:
• Erroneous Data Entry: with constraints and triggers → however, mistypes etc. cannot be detected
• Media Failures: for local disk failures, a parity check suffices, for head crashes use RAID, maintain an archive on
tape, or keep redundant DB copies online
• System Failures: cause the state of transactions to be lost (local variables and instruction pointer), e.g. on software
errors or power loss → re-running a transaction might not help (e.g. for i++, has it already executed?) → logging
approach
A log manager maintains the log and has to deal with the buffer manager. The transaction manager issues signals to the
log manager such that the latter can write information onto the log that describes operations that are taking place in the
DMBS.
12.1.1 Operations of Transactions
When a transaction reads a database element (e.g. a tuple), that element must be brought to a main-memory buffer from
disk. Then the transaction can read this buffer into its own local address space. When writing a value, the reverse route
is taken. Note however, that the buffer might not be immediately written back to disk but only when the buffer manager
deems it to be appropriate. We use the following primitives: Note that for both WRITE and READ we require that X already
Operation Description Issued By
INPUT(X) copy disk block containing element X to a memory buffer buffer manager
READ(X,t) copy element X to transaction’s local variable t transaction
WRITE(X,t) copy value of t to database element X in memory buffer transaction
OUTPUT(X) copy block containing X from its buffer to disk buffer manager / log manager
is in a main-memory buffer. If this is not a case, a READ(X) is executed first. The above operations only make sense for
elements that are within a single block. Thus, we require a database element to be no larger than a single block.
12.1.2 Loggings Basics
In order to be able to repair databases after failures, we need a log file that states exactly what changes were made to
the system and in which order. One can view this file as a file that allows only appending to it, namely the log manager
records each important event that occurs. The log blocks are then written to disk as soon as it is feasible and appropriate.
We generally allow the following types of log records:
• <START T>: transaction T has begun
• COMMIT T>: transaction T has completed successfully and will make no more changes. What this means for the
data to appear on disk is dependent on the logging model
• <ABORT T>: transaction T did not complete successfully, no changes have been copied to disk
Now we need one more log type to record updates to elements, this however varies for different logging models.
12.1.3 Failure during Recovery
It is possible that the system crashes during recovery from a previous crash. All of logging methods that follow have
one essential property, namely that recovery steps are idempotent, i.e. repeating the same recovery step multiple times
produces the same result as doing it once only.
12.2 Undo Logging
In undo logging we repair the database after a failure by undoing effects of transactions where completion cannot be
guaranteed. For our update log record, we thus need to store the old value of each element we are altering in a transaction.
For that reason, the update triple is of the form <T,X,v> where v denotes the old value of X before the update took place.
34
12.2.1 Rules
Theorem 12.1 (Undo-Logging Rules). Undo loggings is sufficient to allow recovery from a system failure if the
transactions and the buffer manager obey the following rules:
U1: T modifes X =⇒ log record <T,X,v> must be written to disk before new value of X is written to disk.
U2: T commits =⇒ log record COMMIT must be written to disk only after all database elements changed by T have
been written to disk, but as soon thereafter as possible
To be able to force the log file to be write the log file to disk, we introduce a new FLUSH LOG command.
12.2.2 Background Activity
Assume multiple concurrently executing transactions → a log for a transaction T might me interleaved with records for
other transactions. These might even flush the log, such that log records from T appear on disk earlier than is implied by
the flush-log actions. This is, however, not problematic since the essential policy for undo logging is that <COMMIT T> is
never written before the OUTPUT actions for T are completed.
If two database elements A, B share a block, the situation gets trickier, since writing A to disk also results in writing B
to disk. This can in the worst case violate U1. For this reason we suggest that blocks be the database elements, such that
scenarios like this can not happen.
12.2.3 Recovery Using Undo Logging
The recovery manager scans the log file from the end. It remembers all transactions T for which it has either seen a
<COMMIT T> or an <ABORT T> record. Upon witnessing an update record <T,X,v>, it performs the following routine:
1. if T has committed =⇒ do nothing
2. else: T is incomplete or aborted =⇒ restore old value v and assign it to X.
For every incomplete but previously not aborted transaction T, write a log record <ABORT T> and flush log.
12.2.4 Checkpointing
Want to avoid scanning the whole log (since its huge) and the probability of a transaction in the far past being affected
by the failure is almost zero. =⇒ checkpoint the log periodically.
1. Stop accepting new transactions, wait until all currently active transactions commit or abort and have written the
corresponding event to the log.
2. Flush log to disk
3. Write log record <CKPT>, flush log again and resume accepting transactions.
Recovery with a quiescent checkpoint like this is easy, it works like before, but as soon we witness a <CKPT> record, we
can stop, since all previous transactions completed (with commit or abort) and have written COMMIT or ABORT to the disk
→ all elements have written to disk before that record by U2)
12.2.5 Non-Quiescent Checkpointing
Problem: must effectively shutdown system, this is not possible sometimes → allow new transactions to enter:
1. Let T1, . . . , Tk be the currently active transactions. Write log record <START CKPT (T1, . . . , Tk)> and flush log
2. Wait until T1, . . . , Tk to commit/abort, but allow new transactions to start
3. When T1, . . . , Tk have completed, write log record <END CKPT>
Having a log file like this makes recovery somewhat more complicated. We still find all incomplete transactions as we scan
the log from the end, but we distinguish on what we see first:
• <END CKPT> → need only scan backwards to the corresponding <START CKPT (T1, . . . , Tk)> but not any farther.
• <START CKPT (T1, . . . , Tk)> → crashed during checkpoint. only need to consider transactions T1, . . . , Tk and transactions we scanned before reaching the starting checkpoint record (note that these transactions started later, but
are scanned first since we start from the end)
We could use pointers to chain together log records that belong to the same transaction → no need to scan whole log
anymore.
35
12.3 Redo Logging
Undo Logging has a problem that it allows a transaction to commit only after all elements have been written to disk first.
This might lead to many disk I/O’s → faster if changes to database can reside in memory for some time.
In Redo Logging we ignore incomplete transactions and instead repeat changes made by committed transactions. This
requires us to store the new value in the log update record rather than the old value. Namely, an update record is of the
form <T,X,v> means that transaction T wrote v to X.
Theorem 12.2 (Redo-Rule). The write-ahead logging rule for redo logging states:
R1: Before modifying X on disk, all logs pertaining this modification (<T,X,v> and <COMMIT T>) must appear on disk.
The COMMIT follows all update records. Thus, the log is written to disk first and the elements are written to disk only
after that.
12.3.1 Recovery with Redo Logging
R1 =⇒ if there is no <COMMIT T> records, then T has written no changes to disk. Transactions like these can be treated
as if they never happened. Then we can recover:
• Identify committed transactions
• scan log forward from beginning, and for each update <T,X,v> encountered, write v into X if T committed and do
nothing if T is not committed.
• Write a <ABORT T> record for each incomplete transaction T, flush log.
12.3.2 Non-Quiescent Checkpointing
Changes can be written to disk long after the transaction commits =⇒ must also consider transactions that were active
before we decided to generate a checkpoint. We need the buffer manager to keep track of which buffers are dirty and
which transactions modified which buffer.
The checkpoint can, however, be completed without waiting for the transaction to complete since they are not allowed to
write their pages to disk at that time anyway:
• Let T1, . . . , Tk be active. Write record <START CKPT (T1, . . . , Tk)>, flush log
• write to disk elements that were written to buffers but to disk by transaction that committed before the START CKPT
was written to the log
• Write <END CKPT> to log and flush log.
12.3.3 Recovery with Checkpointed Redo Log
We again case split on what the last checkpoint record is:
• <END CKPT>: only the Ti
’s and all transactions that started after beginning of the checkpoint creation need to be
considered. =⇒ start where the earliest of the Ti
’s start. Note, however, that this start can be before an arbitrary
amount of other checkpoints.
• <START CKPT (T1, . . . , Tk)>: search back to the previous <END CKPT> log record and proceed as described.
36
12.4 Undo/Redo Logging
Problem: If database elements are not complete blocks, both the undo and redo logs may put contradictory requirements
on how buffers are handled during a checkpoint. If a buffer contains element A changed by commited T and element B
by transaction S that has not yet written COMMIT to disk, then have to copy the buffer to disk due to A while B at the
same time prohibits this.
=⇒ Undo/Redo logging increases flexibility at the expense of maintaining more information in log files, i.e. an update
record stores both the old and the new value and is thus of the form <T,X,v,w>.
12.4.1 Rules
Theorem 12.3 (Undo/Redo Logging Rules). The single undo/redo logging rule states:
UR1: Before modifying X on disk due to changes made by T, it is necessary that the update log record <T,X,v,w> appears
on disk.
This model enforces only constraints that are enforced by both undo and redo logging =⇒ <COMMIT T> log record can
precede or follow any of the changes to database elements.
12.4.2 Recovery with Undo/Redo Logging
Have information to undo T or to redo T, this leads to the following policy (we have to do both, since some committed
transactions might not have their changes written to disk or uncommitted transactions have changes on disk already):
1. Redo all committed transactions from earliest to latest
2. Undo all incomplete transactions from latest to earliest
12.4.3 Non-Quiescent Checkpointing
1. For active transactions T1, . . . , Tk write log <START CKPT (T1, . . . , Tk)> and flush log
2. Write all dirty buffers to memory
3. Write <END CKPT> to log and flush log
The second point allows us to write data to disk by incomplete transactions =⇒ we can now tolerate database elements
that are smaller than complete blocks, as long as the following requirement is met:
Theorem 12.4. A transaction must not write any values (even to memory buffers) until it is certain not to abort.
12.4.4 Delayed Commitment & Problems
A system using undo/redo logging allows behaviours where a transaction has been completed, but because the COMMIT
record was not flushed to disk, a subsequent crash will lead to the transaction be undone rather than redone. If this is
not desired, one can introduce another rule:
Theorem 12.5 (Second Undo/Redo Rule). The set of rules can be extended with
UR2: A <COMMIT T> record must be flushed to disk as soon as it appears in the log.
12.4.5 Strange Behaviours of Undo/Redo Recovery
Assume the following scenario:
• transaction T has committed and is redone.
• T read a value X written by some transaction U that has not committed and thus is undone.
For recovery, we didn’t specify whether we first undo or redo. This is because both can lead to a final state that does not
correspond to any sequence of atomic operations:
• When we redo first, we leave X with its value prior to U.
• When we undo first, we leave X with its value written by T
The scenario makes no sense in either ways =⇒ this is why concurrency control and recovery are never decoupled in
practice!
37
13 Atomic Commits
13.1 Distributed Consensus
Distributed Consensus is a problem of reaching an agreement among all processes on the value of a variable. =⇒
undecidable in an environment with asynchronous communication and possible failures.
Definition 13.1 (Atomic Commitment). Five properties need to be enforced:
AC1: all processors reach same decision → consensus
AC2: a processor cannot reverse its decision
AC3: Commit can only be decided if all processors vote YES to no imposed decisions
AC4: no failures and all voted YES results in decision to commit → non-triviality
AC5: if there is an execution with normal failures, all of which are repaired and no more failures occur for
sufficiently long, then all processors will eventually reach a decision → liveness
13.2 2-Phase Commit Protocol
2CP is a distributed algorithm that coordinates all processes that participate in a distributed atomic transaction on
whether to commit or abort the transaction.
1. In the Voting Phase, the coordinator sends a query to commit message to all participants, and waits for their reply.
Participants, upon, receiving this message execute transaction up to point where they will be asked to commit. Then
replies with an agreement message, either YES if it will commit or NO otherwise
2. In the Commit Phase: there are two possible outcomes:
• if all participants voted YES → coordinator sends commit message to participants, they complete operations
and commit and send back and acknowledgement. Upon having received all acknowledgements, the coordinator
completes the transaction.
• if any participant voted NO → coordinators sends a rollback message, each participant undoes its transaction
(via logging) and sends an acknowledgement message back. Coordinator undoes transaction upon havin received
all acknowledgements.
=⇒ 2PC is a blocking protocol. ← coordinator fails after having registered all YES votes, but before sending commit
message. In this case, all processors are in the uncertainty period state =⇒ all have voted YES. But since processor p1
being uncertain does not mean that all the others are uncertain means that processors cannot decide on their own in the
absence of the coordinator.
All other time-outs (e.g. wait for votes) can be handled by aborting prematurely.
13.2.1 Persistence
Persistence is achieved by writing a log-record, flushed to disk for every state change =⇒ very expensive. It works as
follows:
• when sending a VOTE-REQ the coordinator writes a START-2PC to the log record
• if participant votes YES, it writes YES to log before it sends vote. If it votes NO, it writes a NO record
• when coordinator decides, it writes a COMMIT/ABORT log record before sending any message.
• after receiving coordinator’s decision, participants write their own decision in the log.
13.2.2 Linear 2PC
Assume list of nodes. First sends local decision (YES/NO) to second. A NO is passed on if any previous node decided
to locally abort. The last node becomes the coordinator, passes on global decision (commit if YES, abort if NO) back
linearly. the first node then sends a single acknowledgement to the last node.
+ less communication, only 2n + 1 messages instead of 3n
– inefficient for large number of nodes
38
13.3 3-Phase Commit Protocol
Invariant: no operational process can decide to commit if there
are operational processes that are uncertain.
=⇒ Coordinator must first tell processes (after it has made
the decision) what is going to happen. If all participants voted
yes initially, then the coordinator sends a “pre-commit” message, which all of the participants have to acknowledge before
the coordinator sends the final commit message.
The extra round of messages are used to spread knowledge
across the system → provide information about what is going
on about other processes, such that the invariant holds. The
invariant is used in cases where time-outs occur:
• any timeout before the vote stands =⇒ abort
• coordinator times-out waiting for ACK =⇒ ignore, all agreed to commit
• participant times-out waiting for pre-commit =⇒ uncertainty period, ask around
• participant times-out waiting for commit message =⇒ ask around
13.3.1 Persistence
• coordinator writes a START-3PC record before doing anything and writes a COMMIT/ABORT record before sending any
such message
• participant writes YES to log before sending it, and NO only after sending it to the coordinator. Upon reaching a
decision, it writes it in the log.
This persistence procedure aids recovery in the following way: It is not possible for 3PC processes to recover independently
unless the decision was already reached or they have not participated at all.
• Coordinator: only if it finds the start record, looks if there is decision record, if none, then ask around what
decision was.
• Participant: If YES record but no decision, ask around. If it hasn’t voted, it’s safe to abort
The “ask-around” feature can be implemented by the termination protocol.
13.4 Termination Protocol
A new coordinator is elected ans sends a state request message to all processes. The processes send back their state
(aborted, committed, uncertain, committable).
Definition 13.2 (Decision Rules). The coordinator uses the following rules to decide:
TR1: ∃ aborted =⇒ abort
TR2: ∃ commited =⇒ commit
TR3: ∀ uncertain =⇒ abort
TR4: ∃ committable ∧ ¬∃ commited =⇒ send PRE-COMMIT to all, wait for ACKs, send commit message.
Note that this protocol does not tolerate communication failures. If coordinator fails after asking for the state but before
sending any pre-commit message, we start all over again.
Total Failures: if after total failure, all processes are still uncertain → find last one to fail, if still uncertain, then abort.
39
14 Replication
Replication leads to better performance, higher fault tolerance and can also support different application types, e.g. compare one replica for OLTP and one for OLAP vs only one DB for both.
Can group replication strategies into 4 categories:
Primary Copy Update Everywhere
Synchronous (eager)
Asynchronous (lazy)
• Synchronous: propagates changes to data within transaction immediately to all existing copies =⇒ ACID
properties apply to coy updates too
• Asynchronous: transaction only updates local copy, then changes are propagated =⇒ time where copies are
inconsistent
• Update Everywhere: changes can be initiated at any copy
• Primary Copy: only master copy can be updated, other secondary copies are updated
While Synchronous Update Everywhere may sound like the best choice, it is way to expensive and doesn’t scale well.
For that reason, commercial DMBS mostly implement asynchronous primary copy, sometimes also asynchronous update
everywhere.
Response Times: Asynchronous Update Everywhere → Asynchronous Primary Copy → Synchronous Update Everywhere → Synchronous Primary Copy
14.1 Database Replication Strategies
ACID applies to transactions. Isolation is implemented through 2PL, atomicity through 2PC =⇒ transaction manager
takes care of this.
14.1.1 Managing Replication
Atomicity can be guaranteed by using 2PC → problem is how to make sure that serialization orders are the same at all
sites =⇒ need for a replication protocol. (what we looked at before)
14.2 Dealing with Site Failures
Instead of writing all copies, we only write available copies. Only write if nobody objects (note that no answer is not
an objection). When validating, check that all available sites are still available and all missing sites are still down. Only
commit in that case, otherwise abort.
14.3 Dealing with Communication Failures & Quorums
Definition 14.1 (Quorum). Quorums are set of sites formed in a way as to be able to determine that it will have
non-empty intersections with other quorums.
All Quorums should be of roughly the same size and have equal responsibility. It should be possible to dynamically
reconfigure them. The communication overhead should be low and the additional overhead should be proportional to
failures.
40
14.3.1 Weighted Quorums
Each copy has a weight assigned to it and let N be the total weight. Then let RT, W T be thresholds for read and write,
respectively, such that 2 · W T > N and RT + W T > N.
• Read Quorum: set of copies with weight ≥ RT
• Write Quorum: set of copies with weight ≥ W T
Assign to each copy a version number (not necessarily unique). Then:
• upon READ contact sites until read quorum is formed, read data with highest version number
• upon WRITE contact sites until write quorum is formed, get version number of copy with highest version number (k),
write to all sites with new version number (k + 1)
=⇒ free recovery but no local reads
15 Key Value Stores
KVS are a type of NoSQL database system that support only get and set operations. Instead of an underlying data
schema, there are just keys attached to a blob/hash.
• “Schema”: Key + Blob → index on key
• Deployment: horizontal partitioning, replication of partitions
• Replication strategy: with quorums and asynchronous replication across all copies
  
Advantages
Data-Lookups are incredibly fast due to the hashing mechanism. It is easy to scale the system by simple adding more
copies to it. In applications such as looking up user profils, retrieve users webpages etc. it is useful and thus very fast,
when the underlying data really does not consist of much more than a value pair.
Disadvantages
Data is often inconsistent and correctness depends on the application, not on the DMBS itself. More complex queries like
ranges/joins are not supported trivially, e.g. one has to look at all the key-value pairs. Queries on attributes do not work
simply for the reason that attributes don’t exist.
Problems
The whole complexity and responsability issues still exist, but they are pushed to the application side. This results in
very expensive operations such as range queries or joins.
=⇒ this can work very well for highly specialized systems or for caches, but cannot replace a full-blown database.
41
