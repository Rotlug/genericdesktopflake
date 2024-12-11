{ app-pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = app-pkgs.vscode;

        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;

        userSettings = {
            "git.enableSmartCommit"= true;
            "git.autofetch"= true;
            "git.confirmSync"= false;
            "editor.fontSize"= 16;
            "editor.fontFamily"= "'Monaspace Xenon', 'monospace', monospace";
            "terminal.integrated.gpuAcceleration"= "on";
            "editor.cursorBlinking"= "smooth";
            "editor.cursorSmoothCaretAnimation"= "on";
            "editor.mouseWheelZoom"= true;
            "editor.cursorWidth"= 3;
            "window.dialogStyle"= "custom";
            "window.titleBarStyle"= "custom";
            "diffEditor.ignoreTrimWhitespace"= false;
            "workbench.iconTheme"= "material-icon-theme";
            "[javascript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[typescript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[typescriptreact]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[dart]"= {
                "editor.tabSize"= 2;
                "editor.insertSpaces" = true;
                "editor.detectIndentation" = false;
                "editor.suggest.insertMode" = "replace";
            };
            "editor.formatOnSave" = true;
            "editor.smoothScrolling" = true;
            "editor.tokenColorCustomizations" = {
                "[Default Dark Modern]"= {
                "textMateRules"= [
                    {
                        "scope"= "emphasis";
                        "settings"= {
                            "fontStyle"= "italic";
                        };
                    }
                    {
                    "scope"= "strong";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "entity.other.attribute-name";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "markup.underline";
                    "settings"= {
                        "fontStyle"= "underline";
                    };
                    }
                    {
                    "scope"= "markup.bold";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "markup.heading";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "markup.italic";
                    "settings"= {
                        "fontStyle"= "italic";
                    };
                    }
                    {
                    "scope"= "storage.type";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "storage.modifier";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "name"= "String interpolation";
                    "scope"= [
                        "punctuation.definition.template-expression.begin"
                        "punctuation.definition.template-expression.end"
                        "punctuation.section.embedded"
                    ];
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= "keyword.control";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= [
                        "keyword.operator.new"
                        "keyword.operator.expression"
                        "keyword.operator.cast"
                        "keyword.operator.sizeof"
                        "keyword.operator.logical.python"
                    ];
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "name"= "this.self";
                    "scope"= "variable.language";
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "name"= "@Decorator";
                    "scope"= ["meta.decorator punctuation.decorator"];
                    "settings"= {
                        "fontStyle"= "bold";
                    };
                    }
                    {
                    "scope"= ["punctuation.definition.comment" "comment"];
                    "settings"= {
                        "fontStyle"= "italic";
                    };
                    }
                ];
                };
                };
            "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
            "dart.checkForSdkUpdates" = false;
        };

        extensions = with app-pkgs.vscode-extensions; [
            esbenp.prettier-vscode
            dart-code.dart-code
            dart-code.flutter
            pkief.material-icon-theme

            ms-python.python
            ms-python.vscode-pylance
            bradlc.vscode-tailwindcss

            ms-vscode.live-server
        ];

        mutableExtensionsDir = false;
    };
}
