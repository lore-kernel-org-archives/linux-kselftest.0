From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 21 Mar 2019 20:12:48 -0700
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
In-Reply-To: <20190322024652.GA3679@jagdpanzerIV>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
 <20190321032429.2e7jddbltblaekjc@ast-mbp.dhcp.thefacebook.com>
 <20190321050852.GA1534@jagdpanzerIV>
 <20190321154928.GT7431@mini-arch.hsd1.ca.comcast.net>
 <20190322024652.GA3679@jagdpanzerIV>
Message-ID: <20190322031247.6somplkx7lmr3ksm@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322031248.VQvu607b1cHUJhGF1dgQqo7ZAG-aqZL7UxxIP_UTjVA@z>

On Fri, Mar 22, 2019@11:46:52AM +0900, Sergey Senozhatsky wrote:
> On (03/21/19 08:49), Stanislav Fomichev wrote:
> > On 03/21, Sergey Senozhatsky wrote:
> > > On (03/20/19 20:24), Alexei Starovoitov wrote:
> > > > On Wed, Mar 20, 2019@09:53:33PM +0900, Sergey Senozhatsky wrote:
> > > > > Not all compilers have __builtin_bswap16() and __builtin_bswap32(),
> > > > > thus not all compilers are able to compile the following code:
> > > > > 
> > > > >         (__builtin_constant_p(x) ? \
> > > > >                 ___constant_swab16(x) : __builtin_bswap16(x))
> > > > > 
> > > > > That's the reason why bpf_ntohl() doesn't work on GCC < 4.8, for
> > > > > instance:
> > > > 
> > > > nack to fixes to support such old compilers.
> > > 
> > > Fair enough.
> > What is too old? Documentation/process/changes.rst says that minimum
> > supported gcc is 4.6, do we lift that requirement for the tests?
> 
> Hmm, good point, Stanislav. I thought it was gcc 4.9 which introduced
> asm goto and hence 4.9 is the minimum supported version. But it seems
> that it was 4.5/4.6, so the min supported gcc version is 4.6. Which
> means that those bpf defines won't work on some compilers.
> 
> Alexei, does your NACK still stand?

yes.
bpf samples and selftests require llvm and new features like BTF
require the latest llvm which requires gcc 5.1.
Things are more or less working still with gcc 4.8, but soon will
likely start breaking.
