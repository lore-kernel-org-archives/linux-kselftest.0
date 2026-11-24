Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498299;
	b=30eFzszE66kfEkUAAOka7Ln2iigZfVOjKXQvb8X0BkceMFrMCPOh4iSGlesdl+eUqEQg
	 9Bj80eVI6tTjKfwZtS3QM+vViHnJF45UPutzyaKQjMUBM5Ga43R6UR3VpS0diRXyQ4Fnj
	 XS4H+eO4FQKEEFqs9d7kDRPDzqNGjFx/ayDQXsWZ/3NNuHi6K2xEkuqNFge+qVScWB+O/
	 4ghWrEJ0kMHwJYjEgmTPvhWnKSxo/+Fs1/6pGBplGfOOD2E2VcAnrTNtkQEgPFl4o11yR
	 7rbHB4FH4pD2O9GmV8vIRtWyJuUjDnBM7Vi3drdjNUltq93oJ05pacjqa80K0o4vHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
	b=PUJSMQU9eE8Htz/9hXetRzIGYYQyFBCIOOSKGmR2cNTIHWpH0N7xnQyNxYUP86WUiac1
	 vGpCFGJ9nDv6G+BucDHqVFXYGnwlVKZM2ZJ5NicJjTcYklHmUCC3Gjf7nOqqOY83fjagN
	 VUU8U0bP6ustfAcP0L5x7tWgM0HqQQBN0cJfHjz7z5CzbGn5SSwtAV5tAAUTrvUy/ULMh
	 uBSIPqUKZjgh2xwBnNZvHOEAadfE92zp/z6Rbpy9ho6yob1sjiL+ioKe5/e4BsCFJfrGA
	 CC6XlxWrlo0iefIgUIMhBF30fcHuUKPCnbI/0AU2Lo7jcZiAUh+7yTL8QphcmAhEIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL2OexmH;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42A606A322
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 05:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D42A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL2OexmH
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cd697a57d7eso1163390a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498299; x=1796103099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=IL2OexmHvHFKYHluRIKtNYMqUEc5MTXHSaKYpwbh+Hj/xk9TMIYcyvQeRcQZBqGbLx
         JvrRAPkJzFw22AtCCgQtKJTaef7PeUHoR84RpieUxP1PXls7QB3w9/r66UxCDpukSGB4
         ReTmmwpM6RYXhALKZRMzc1Plj6nB8PoGLzkzXTS+Cgj4gsrYY+Ya7onI1BmnTaOLPyIn
         3xdPootTOygbq5YGD5Gugw0IPDBsx29+1QlBAEBZD6otGftJu8Rmcb7+uvXGQ/kFU7t9
         t1JTqcWTEoBb/hXzW9xSJk83RaFgh97gpXTz1R8zNB0szVMIZ3akveKMEiYVkKT+PbyA
         +95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498299; x=1796103099;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=x5GE988WKjKCunyktVvgxgGPBB1tUjbJOlH2N27rDwva/OP1wSxtePu5UWR0N9QWFz
         HZqVnyFXXfT7ABtotxerx3m67RxM9WXS7sl62yJmSiJMpZT6ch9mHxAp9ry8DOzTTr5k
         cEz/ONMknINEvhsNo761GthoZ1Nx7FVPlMEYO015YYwtU20UzpiXb8f4dRxgF5mRIlIp
         wzzNcIv9Jy7CRJLEMm5tehppqn/7lJYAr7AiHSmQv5jwO+hnJapo5Twbuqc0Rz0miQ5q
         OlRYKHUQ4HTUpEENN0kRxwor9LyXJVXquj8C7+uPUSGwvoI9Yn8zqtsLRsfVwbJjT4Yr
         XazA==
X-Forwarded-Encrypted: i=1; AL+hErEvpCQpkQ98BrTtd4MVsFt4y6bc2IC3ZCemEpLeb9Ct0TkGaQaZX65aTGQ1V3sgJmrQnuiREqGXq9PjNVFwxnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ptyEOw+Jqd4UpWqD99jnCwEiYoSugS1Y1gI6YqTm2JwQgPJZ
	pBOgXYwC73tfpLD7l07Ihiq35pnUxBJDN545bbBSjtAz1fWetE/OvtA9
X-Gm-Gg: AZFdTZdgq+IRTSqgVM1grQnlCRCPIDAinKnDLWHbs/7R5Nxfjw0jYeolAmHh/ZZb8RO
	rpo1hSPKVmlZ4yh0+QMzAI0ApnD4w5G+f1+0/rPz/0mKCgtY6ADJgM2i0NdCegh9F1XZSokm5Ke
	mE7NrZEJQJCIzyd6uBAsrvVf/ORWmAh6aLErUaWrkM/t/WiIuXYsG21uwLA3lS3u2GowWMPTbYw
	rHUD1oGYAC3ROR8Lo+qC2h2f1GUefUd57oRxRfgXQl73tNNytqNoVdXscCwzqjkuGIPxrAKFVCW
	NBd06niKX43JDyYFkBG5HKNiRV90g8E2XNfZPkhoFhKacXXUiBILBx5Ma0GOKt76Ctlctp9DNPI
	p1j5zBz1thQbNWVhHztU0p73vP6ctMnqiH9Ir0ZhNQs0ZXLFpS9j4If10gqTX/LL3lUWsJd9kPn
	89ee2p5ej0e/D3twCQhWRIUI9GS+6aJssF/rfV3A6u6bv2mFNUALFNsFrtAMxHWSCvz2IFUBz55
	55BwLSPAiujFOp5WsmVFHUxSzDNbyTlxfSLrM+Jkim7WQkZn4pfjwIgw5Ry9i8Gez0gJrQr1raT
	AvgWlX6YLXAHfBhZwdEvPluAeO55eRLTHd1VdgZdu720ceKfMxPu
X-Received: by 2002:a05:6a20:7d9b:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-4014e25b4f1mr12376756637.81.1795498298665;
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Received: from [192.168.22.174] ([114.246.237.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm6562442a12.0.2026.11.23.21.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Message-ID: <286b4604-fb68-452c-b131-d3847669726f@gmail.com>
Date: Tue, 24 Nov 2026 13:31:29 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/5] KVM: riscv: Avoid THP adjustment for
 existing 4K G-stage leaves
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu
 <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
 <20260815103245.864925-1-jinyu.tang@linux.dev>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260815103245.864925-1-jinyu.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jinyu,

On 8/15/2026 6:32 PM, Jinyu Tang wrote:
> When dirty logging is disabled after a G-stage PMD mapping has been
> split, the fault path may see a 4K G-stage leaf while the backing host
> page is still THP-backed. The existing kvm_riscv_gstage_map_page()
> comment says that this path should update the small leaf and leave huge
> mapping recovery to a later ioctl path.
> 
> However, transparent_hugepage_adjust() runs before that G-stage lookup
> and rewrites the fault GPA to the PMD base. If the original fault is not
> at the PMD base, the lookup can find and update the wrong 4K leaf.
> 
> Check the original fault GPA in transparent_hugepage_adjust(). If it
> already has a 4K G-stage leaf, skip THP adjustment and keep handling the
> fault at PAGE_SIZE granularity.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index bfd6168ebe30..2fabcd409991 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -500,10 +500,21 @@ static int get_hva_mapping_size(struct kvm *kvm,
>   
>   static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
>   						 struct kvm_memory_slot *memslot,
> +						 struct kvm_gstage *gstage,
>   						 unsigned long hva,
>   						 kvm_pfn_t *hfnp, gpa_t *gpa)
>   {
>   	kvm_pfn_t hfn = *hfnp;
> +	u32 ptep_level;
> +	pte_t *ptep;
> +
> +	/*
> +	 * Keep the existing split G-stage leaf and update the original
> +	 * faulting 4K page in the vCPU fault path.
> +	 */
> +	if (kvm_riscv_gstage_get_leaf(gstage, *gpa, &ptep, &ptep_level) &&
> +	    !ptep_level)
> +		return PAGE_SIZE;
>   
>   	/*
>   	 * Make sure the adjustment is done only for THP pages. Also make
> @@ -730,7 +741,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>   	 * so do not promote them through the THP helper.
>   	 */
>   	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
> -		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
> +		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, &gstage,
> +							   hva, &hfn, &gpa);
>   
>   	if (writable) {
>   		mark_page_dirty_in_slot(kvm, memslot, gfn);

Thanks for your work.

Tested this patch on v7.4-rc4.

FYI:
https://lore.kernel.org/qemu-devel/95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com/

Tested-by: Gong Shuai <gong.shuai@sanechips.com.cn>

Best regards,
Shuai

