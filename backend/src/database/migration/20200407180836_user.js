
exports.up = function(knex) {
    return knex.schema.createTable('user', function(table){
        table.string('uid').primary();
        table.string("name").notNullable();
        table.string('password').notNullable();
        table.string('phonenumber').notNullable();
        table.string('email');
    });
};

exports.down = function(knex) {
    knex.schema.dropTable('user');
};
