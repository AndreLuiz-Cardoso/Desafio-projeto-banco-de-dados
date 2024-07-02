## About
The challenge proposes the analysis of a scenario in which the fictitious company ECOMMERCE seeks to aggregate information about its sales. Thus, it is necessary to create a database that includes the entities product, inventory, supplier, order, and customer. Consequently, the participant is challenged to execute the creation of a conceptual project based on an ER (Entity-Relationship) model.

The Entities Required by Stakeholders Have the Following Characteristics:

### Regarding Products
They are sold through a single online platform, though they may have different sellers.
Each product has only one supplier.

An order can consist of one or more products.

### Regarding Customers
Customers can register on the website with either CPF or CNPJ (Brazilian taxpayer ID).
The shipping address determines the shipping cost.

A customer can purchase more than one order. There is a grace period for product returns.
Regarding Orders

Orders are created by customers and include purchase information, address, and delivery status.
One or more products make up an order.

An order can be canceled.

### Regarding Suppliers and Inventory
It is the participant's responsibility to model this information.

### Methodology

### Conceptual Design
A conceptual model is an abstract model that describes the structure of a database independently of the DBMS (Database Management System). Therefore, MySQL Workbench will be used to create an entity-relationship diagram. In this diagram, entities and their attributes defined by stakeholders will be described, along with additional attributes required for suppliers and inventory, as refined by the participant. These refinements include:

Customer PJ (Legal Entity) and PF (Natural Person): An account can be either PJ or PF, but not both. Therefore, an entity called "information" was created to relate CPF/CNPJ to the customer's email (id), along with a boolean attribute that indicates the type of legal registration. If it is a CPF, it will be assigned 0; if CNPJ, it will be assigned 1.
Payment: Multiple payment methods can be registered, with the option to record only one piece of information per method.
Delivery: It includes status, tracking code, and maximum delivery date.
