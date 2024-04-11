const { ApolloServer, gql } = require("apollo-server");

const books = [
    {
        title: "Harry Potter and the Sorcerer's Stone",
        author: "J.K. Rowling"
    },
    {
        title: "The Hobbit",
        author: "J.R.R. Tolkien"
    }
];

const typeDefs = gql`
    type Book {
        title: String
        author: String
    }

    type Query {
        test: [Book]
    }
`;

const resolvers = {
    Query: {
        test: () => books,
    },
};

const server = new ApolloServer({
    typeDefs,
    resolvers
});

server.listen({ port: 4001 }).then(({ url }) => {
    console.log(`Server ready at ${url}`)
});
