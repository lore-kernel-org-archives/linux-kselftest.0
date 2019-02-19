From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Mon, 18 Feb 2019 20:28:44 -0800
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNAThSm1n1B_Ss0gRDZ3H-DWj2bvpZ+6Ui2jEo4Pt9YynEA@mail.gmail.com>
References: <20190211143600.15021-1-joel@joelfernandes.org>
 <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
 <CAK7LNAThSm1n1B_Ss0gRDZ3H-DWj2bvpZ+6Ui2jEo4Pt9YynEA@mail.gmail.com>
Message-ID: <20190219042843.x4rf526x4x6dprli@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190219042844.ulvw_M1EVTw9SEri90UU226zMFY3Ddq0yNgWGDyLTwI@z>

On Tue, Feb 19, 2019@01:14:11PM +0900, Masahiro Yamada wrote:
> 
> I was able to compile it in-tree
> but it makes the incremental build extremely slow.
> 
> (Here, the incremental build means
> "make" without changing any code after the full build.)
> 
> Before this patch, "make -j8" took 11 sec on my machine.
> 
> After this patch, x86_64_defconfig + CONFIG_IKHEADERS_PROC=y
> takes 53 sec for me since kernel/kheaders_data.txz is regenerated
> every time even when you did not touch any source file.
> 
> We should take time for careful review and test.
> 
> Please give me more time for thorough review.

Thanks for taking a look. All are very valid points.
Incremental build is must have.
