
import type { CodegenConfig } from '@graphql-codegen/cli';

const config: CodegenConfig = {
  overwrite: true,
  schema: "http://localhost:4000",
  generates: {
    "lib/data/models/app_models.dart": {
      plugins: ["flutter-freezed"],
    }
  }
};

export default config;
