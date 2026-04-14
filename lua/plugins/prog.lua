-- プログラム関連のプラグイン
return {
{
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        -- シンタックスチェック ALE
        -- エラー行に表示するマーク
        g:ale_sign_error = '⨉'
        g:ale_sign_warning = '⚠'
        -- エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
        g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

        -- ファイルを開いたときにlint実行
        g:ale_lint_on_enter = 1
        -- ファイルを保存したときにlint実行
        g:ale_lint_on_save = 1
        -- 編集中のlintはしない
         g:ale_lint_on_text_changed = 'never'

        -- eslint_dを利用するための設定
        -- if vim.fn.executable('eslint_d') then
        --     let g:ale_javascript_eslint_use_global = 1
        --     let g:ale_javascript_eslint_executable = 'eslint'
        -- end
        g:ale_linters_explicit = 1
        -- ESLint \   'javascript': ['eslint']
        --let g:ale_linters = {
        --\       'javascript': ['eslint'],
        --\       'tex': ['chktex'],
        --\       'rust': ['cargo clippy'],
        --\       'python': ['flake8'],
        --\       'sh': ['shellcheck'],
        --\ }
        g:ale_tex_chktex_options = '-n 8'
        --highlight ALEErrorSign ctermbg=NONE ctermfg=red
        --highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        g.ale_linters = {
            lua = {'lua_language_server'},
            sh = {'shellcheck'}
        }
    end
}

