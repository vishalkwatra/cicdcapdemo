namespace officesupplies1.db;

using {Currency} from '@sap/cds/common';

entity Suppliers {
    key ID         : UUID;
        identifier : String;
        name       : String;
        phone      : String;
        building   : String;
        street     : String @multiline;
        postCode   : String;
        city       : String;
        country    : String;
        products   : Composition of many Products
                         on products.supplier = $self;
}

entity Products {
        @Common.Label :                                     'UUID'
    key ID               : UUID;
        identifier       : String           @Common.Label : 'ID';
        title            : localized String @(Common.Label : 'Name');
        description      : localized String;
        availability     : Integer @(Common.Label : 'Stock');
        storage_capacity : Integer @(Common.Label : 'Storage');
        criticality      : Integer;
        price            : Decimal(9, 2);
        currency         : Currency;
        supplier         : Association to Suppliers;
        image_url        : String;
}