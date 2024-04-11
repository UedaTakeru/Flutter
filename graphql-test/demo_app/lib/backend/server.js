const { ApolloServer, gql } = require("apollo-server");

// Sample data
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

// どのようにしてAPIに問い合わせをするのか
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

server.listen().then(({ url }) => {
    console.log(`Server ready at ${url}`)
});
