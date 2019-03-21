From: sergey.senozhatsky.work@gmail.com (Sergey Senozhatsky)
Date: Thu, 21 Mar 2019 14:08:52 +0900
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
In-Reply-To: <20190321032429.2e7jddbltblaekjc@ast-mbp.dhcp.thefacebook.com>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
 <20190321032429.2e7jddbltblaekjc@ast-mbp.dhcp.thefacebook.com>
Message-ID: <20190321050852.GA1534@jagdpanzerIV>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190321050852.9tWnJq_QCrNpjhSEUiLIc54SpK5o6TsKD-OmDHPgi7M@z>

On (03/20/19 20:24), Alexei Starovoitov wrote:
> On Wed, Mar 20, 2019@09:53:33PM +0900, Sergey Senozhatsky wrote:
> > Not all compilers have __builtin_bswap16() and __builtin_bswap32(),
> > thus not all compilers are able to compile the following code:
> > 
> >         (__builtin_constant_p(x) ? \
> >                 ___constant_swab16(x) : __builtin_bswap16(x))
> > 
> > That's the reason why bpf_ntohl() doesn't work on GCC < 4.8, for
> > instance:
> 
> nack to fixes to support such old compilers.

Fair enough.

	-ss
