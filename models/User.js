
const { EntitySchema } = require('typeorm');

module.exports = new EntitySchema({
    name: "User", // Will use table name `user`
    tableName: 'users',
    columns: {
        id: {
            type: "int",
            primary: true,
            generated: true,
        },
        first_name: {
            type: "varchar",
            length: 200,
        },
        last_name: {
            type: "varchar",
            length: 200,
        },
        mobile_no: {
            type: "bigint"
        },
        is_active: {
            type: "tinyint",
        },
        role: {
            type: "tinyint",
        }
    },
});
