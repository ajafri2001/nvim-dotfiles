vim.lsp.start {
    name = "Zoomba LSP",
    -- cmd = {
    --     "java",
    --     "-jar",
    --     -- vim.fn.expand "/home/ajafri/.local/bin/zmb/zoomba.lang.core-0.3-20250110.092900-73-onejar.jar",
    --     vim.fn.expand "/home/ajafri/Desktop/zoomba/target/zoomba.lang.core-0.3-SNAPSHOT.one-jar.jar",
    --     "/home/ajafri/Desktop/zmb-ls/main.zm",
    -- },

    -- cmd = {
    --     "scala",
    --     "/home/ajafri/Desktop/zmb-ls/scala/scala.scala",
    -- },

    -- cmd = {
    --     "python",
    --     "/home/ajafri/Desktop/zmb-ls/py.py",
    -- },

    cmd = {
        "scala",
        vim.fn.expand "/home/ajafri/Desktop/lsp-zoomba/target/scala-3.5.2/lsp-zoomba.jar",
        "--main-class",
        "lsp.Main",
    },

    -- cmd = {
    --     "java",
    --     "-cp",
    --     "/home/ajafri/Desktop/zmb-ls/java/Main",
    -- },

    capabilities = vim.lsp.protocol.make_client_capabilities(),
    stdio = true,
}
