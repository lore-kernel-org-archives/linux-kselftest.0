From: pbonzini at redhat.com (Paolo Bonzini)
Date: Mon, 20 May 2019 13:19:40 +0200
Subject: [RFC PATCH 4/4] KVM: selftests: Add the sync_regs test for s390x
In-Reply-To: <20190516111253.4494-5-thuth@redhat.com>
References: <20190516111253.4494-1-thuth@redhat.com>
 <20190516111253.4494-5-thuth@redhat.com>
Message-ID: <3e462f1d-c9c0-ac26-ed59-182fbbf60340@redhat.com>

On 16/05/19 13:12, Thomas Huth wrote:
> +#define VCPU_ID 5
> +
> +static void guest_code(void)
> +{
> +	for (;;) {
> +		asm volatile ("diag 0,0,0x501");
> +		asm volatile ("ahi 11,1");
> +	}

I'd like this to use something like

	register u32 stage = 0 asm("11");
	...
	stage++

instead (yes, it should be fixed in x86 too).

Paolo
