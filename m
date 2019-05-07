From: ldir at darbyshire-bryant.me.uk (Kevin 'ldir' Darbyshire-Bryant)
Date: Tue, 7 May 2019 20:18:58 +0000
Subject: [net-next v3] net: sched: Introduce act_ctinfo action
In-Reply-To: <20190507.123952.2046042425594195721.davem@davemloft.net>
References: <20190505101523.48425-1-ldir@darbyshire-bryant.me.uk>
 <20190505131736.50496-1-ldir@darbyshire-bryant.me.uk>
 <20190507.123952.2046042425594195721.davem@davemloft.net>
Message-ID: <72A692BD-993C-4E88-9E95-9B1D4BFD3320@darbyshire-bryant.me.uk>



> On 7 May 2019, at 20:39, David Miller <davem at davemloft.net> wrote:
> 
> From: Kevin 'ldir' Darbyshire-Bryant <ldir at darbyshire-bryant.me.uk>
> Date: Sun, 5 May 2019 13:20:13 +0000
> 
>> ctinfo is a new tc filter action module.  It is designed to restore
>> information contained in conntrack marks to other places.  At present it
>> can restore DSCP values to IPv4/6 diffserv fields and also copy
>> conntrack marks to skb marks.  As such the 2nd function effectively
>> replaces the existing act_connmark module

Hi David,

> 
> This needs more time for review and therefore I'm deferring this to the
> next merge window.

Thank you.

> 
>> +static inline int tcf_ctinfo_dump(struct sk_buff *skb, struct tc_action *a,
>> +				  int bind, int ref)
>> +{
>> +	unsigned char *b = skb_tail_pointer(skb);
>> +	struct tcf_ctinfo *ci = to_ctinfo(a);
>> +	struct tcf_ctinfo_params *cp;
>> +	struct tc_ctinfo opt = {
>> +		.index   = ci->tcf_index,
>> +		.refcnt  = refcount_read(&ci->tcf_refcnt) - ref,
>> +		.bindcnt = atomic_read(&ci->tcf_bindcnt) - bind,
>> +	};
>> +	struct tcf_t t;
>> +	struct tc_ctinfo_dscp dscpparm;
>> +	struct tc_ctinfo_stats_dscp dscpstats;
> 

All done, I’ve put struct tcf_ctinfo *ci = to_ctinfo(a); at the top though
as other variables need that initialised, hope that’s ok, else please explain
what I should have done.

> Likewise.
> 
> Also, never use the inline keyword in foo.c files, always let the compiler
> decide.

The perils of using existing code, should have spotted that thought, didn’t
inline anything else ‘cos in theory I know better.  Oh well.

Shame checkpatch didn’t warn me about christmas trees or inline otherwise it
wouldn’t have got this far.

Thanks for your time and patience.

Cheers,

Kevin D-B

gpg: 012C ACB2 28C6 C53E 9775  9123 B3A2 389B 9DE2 334A
