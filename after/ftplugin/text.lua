vim.lsp.start {
    name = "Zoomba LSP",
    cmd = {
        "scala",
        vim.fn.expand "/home/ajafri/Desktop/lsp-zoomba/target/scala-3.5.2/lsp-zoomba.jar",
        "--main-class",
        "lsp.Main",
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    stdio = true,
}
