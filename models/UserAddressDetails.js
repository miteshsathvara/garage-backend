
const { EntitySchema } = require('typeorm');

module.exports = new EntitySchema({
    name: "UserAddressDetails", 
    tableName: 'user_address_details',
    columns: {
        id: {
            type: "int",
            primary: true,
            generated: true,
        },
        user_id: {
            type: "int",
        },
        street_address: {
            type: "text",
        },
        city: {
            type: "varchar",
            length: 50,
        },
        state: {
            type: "varchar",
            length: 50,
        },
        zipcode: {
            type: "int"
        },
        latitude: {
            type: "decimal",
            default:null
        },
        longitude: {
            type: "decimal",
            default:null
        },
        garage_name: {
            type: "varchar",
            length: 200,
        },
        owner_name: {
            type: "varchar",
            length: 200,
        },
        is_notification: {
            type: "tinyint",
            default:0
        },
        // created_at: {
        //     type: "timestamp",
        //     default: () => 'CURRENT_TIMESTAMP',
        //     created_at: true, // Automatically sets the creation date
        // },
        // updated_at: {
        //     type: "timestamp",
        //     default: () => 'CURRENT_TIMESTAMP',
        //     onUpdate: 'CURRENT_TIMESTAMP', // Automatically updates the date on update
        // },
    },
});
