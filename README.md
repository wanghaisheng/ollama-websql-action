# Ollama GitHub Action

[![CI](https://github.com/samuelcolvin/ollama-action/actions/workflows/ci.yml/badge.svg)](https://github.com/samuelcolvin/ollama-action/actions/workflows/ci.yml)

GitHub Action to install ollama, pull a model and run the ollama server.

Both the ollama install and the model are cached between runs.

Example usage:

```yaml
      - uses: pydantic/ollama-action@v3
        with:
          model: qwen2:0.5b
```

We can then run tests and connect to `http://localhost:11434` to make requests to ollama. Here we use the [`qwen2:0.5b`](https://ollama.com/library/qwen2:0.5b) model as it's very small and therefore quick to download.

This action is used by [`pydantic-ai`](https://github.com/pydantic/pydantic-ai).

