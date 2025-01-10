vim.lsp.start {
    name = "Zoomba LSP",
    cmd = {
        "java",
        "--add-opens",
        "java.base/jdk.internal.loader=ALL-UNNAMED",
        "-jar",
        "/home/ajafri/.local/bin/zmb/zoomba.lang.core-0.3-20250106.143927-72-onejar.jar",
        vim.fn.expand "/home/ajafri/Desktop/zmb-ls/main.zm",
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    stdio = true,
}
