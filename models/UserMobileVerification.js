
const { EntitySchema } = require('typeorm');

module.exports = new EntitySchema({
    name: "UserMobileVerification", // Will use table name `user`
    tableName: 'user_mobile_verification',
    columns: {
        id: {
            type: "int",
            primary: true,
            generated: true,
        },
        user_id: {
            type: "int",
        },
        otp: {
            type: "int",
        },
        created_at: {
            type: "timestamp",
            default: () => 'CURRENT_TIMESTAMP',
            created_at: true, // Automatically sets the creation date
        },
        updated_at: {
            type: "timestamp",
            default: () => 'CURRENT_TIMESTAMP',
            onUpdate: 'CURRENT_TIMESTAMP', // Automatically updates the date on update
        },
    },
});
