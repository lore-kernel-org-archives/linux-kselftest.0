From: kafai@fb.com (Martin Lau)
Date: Mon, 18 Mar 2019 17:26:19 +0000
Subject: selftests: bpf: test_align Failed to find match 1:
 R1=ctx(id=0,off=0,imm=0) func#0 @0
In-Reply-To: <CA+G9fYuNFJSjH39P71UfZTE4SPGsT4AM2Eg_k++B61ck86k42w@mail.gmail.com>
References: <CA+G9fYuNFJSjH39P71UfZTE4SPGsT4AM2Eg_k++B61ck86k42w@mail.gmail.com>
Message-ID: <20190318172616.qcx2hptcvuohn7cl@kafai-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318172619.kvLsbjYAzIkQsiCxl3k2ZCfG0jYeVFJRXio-VtxBQBI@z>

On Mon, Mar 18, 2019@06:31:53PM +0530, Naresh Kamboju wrote:
> selftests: bpf: test_align
> Test   0: mov ... Failed to find match 1: R1=ctx(id=0,off=0,imm=0)
Thanks for the report.  I will post a fix.
