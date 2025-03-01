return {
  "huggingface/llm.nvim",
  enabled = false,
  opts = {
    model = "qwen2.5:7b",
    url = "http://localhost:11434", -- llm-ls uses "/api/generate"
  },
}
