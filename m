From: sergey.senozhatsky.work@gmail.com (Sergey Senozhatsky)
Date: Thu, 21 Mar 2019 09:34:26 +0900
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
In-Reply-To: <20190320222759.GQ7431@mini-arch.hsd1.ca.comcast.net>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
 <20190320171332.GJ7431@mini-arch.hsd1.ca.comcast.net>
 <4c6db4e5-8e77-2e01-a4ab-25808df2b857@fb.com>
 <20190320222759.GQ7431@mini-arch.hsd1.ca.comcast.net>
Message-ID: <20190321003426.GB2097@jagdpanzerIV>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190321003426.nIZDlNQDkQAwaAhvBG4Cx3eSf-Pvz5bMKF6oKVltyn0@z>

On (03/20/19 15:27), Stanislav Fomichev wrote:
[..]
> > Inside kernel clang compiler header (linux/compiler-clang.h) does not 
> > define __HAVE_BUILTIN_BSWAP16__. So it will go to the "else" branch in 
> > the above. So I think it should work with clang + bpf.
> Hm, isn't it the opposite of what we want then? I think for llvm+bpf we always
> want to use the builtins to make it properly generate
> BPF_TO_BE/BPF_TO_LE instructions.

Oh, hmm, OK. I see your point now. bpf insn set for variables.

	-ss
