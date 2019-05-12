From: daniel at iogearbox.net (Daniel Borkmann)
Date: Mon, 13 May 2019 01:23:52 +0200
Subject: [PATCH v2] selftests: bpf: Add files generated after build to
 .gitignore
In-Reply-To: <20190512072918.10736-1-skunberg.kelsey@gmail.com>
References: <20190512072918.10736-1-skunberg.kelsey@gmail.com>
Message-ID: <d6097853-70e1-b42c-b332-c08da6942efb@iogearbox.net>

On 05/12/2019 09:29 AM, Kelsey Skunberg wrote:
> The following files are generated after building /selftests/bpf/ and
> should be added to .gitignore:
> 
> 	- libbpf.pc
> 	- libbpf.so.*
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>

Applied, thanks.
