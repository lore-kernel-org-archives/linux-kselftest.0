From: mcgrof@kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:41:35 -0800
Subject: [RFC v3 08/19] arch: um: add shim to trap to allow installing a
 fault catcher for tests
In-Reply-To: <20181128193636.254378-9-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-9-brendanhiggins@google.com>
Message-ID: <20181130034135.GN18410@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130034135.3mmQvVSuRSwWdunlJgrsAMVdD4kuCmEYvRL6HmM8RM4@z>

On Wed, Nov 28, 2018@11:36:25AM -0800, Brendan Higgins wrote:
> +static void segv_run_catcher(jmp_buf *catcher, void *fault_addr)
> +{
> +	current->thread.fault_addr = fault_addr;
> +	UML_LONGJMP(catcher, 1);
> +}

Some documentation about what this does exactly would be appreciated.
With the goal it may be useful to others wanting to consider support
for other archs -- if that actually ends up being desirable.

  Luis
