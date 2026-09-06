Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FEE2D5925
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715225; cv=none; b=DQl6t6KqpwQnpbXV6OthesIhrdTeL96x98Lyb7QbHCDWKuTH8jdv54kCjrchKkW9Gk2G4AQHCGb1OQRiuqt55lc5CLR3WmGE/XolYZsGov6vmUYPddD/0gZuhH3OFNSYvaRt0z5ft+TZg/8IaRtEnfVBS5mrtNYCv+nm31X9XrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715225; c=relaxed/simple;
	bh=u8iacqcgJsxhNvW+ZuwYdOLqp3W13cBHeJp8kF5zX5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfVKO643KhYeueD3rfCRXTqzvFm0eQdvS8vMY3DlvRrS9TlZuYsTGpQFdrJf9qQe0mBHgHx0q7Db726aGJsBTjRgazGqwxuBdWh7h2NLiJNe5tHx0Ba9YNY0ZFrwhjKhj14aXs68LtFSgnf/VW/jdoICDE8w6YLSsCxrpBHEzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XsrAyl66; arc=none smtp.client-ip=95.215.58.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XsrAyl66"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u8iacqcgJsxhNvW+ZuwYdOLqp3W13cBHeJp8kF5zX5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788715221; v=1; x=1789320021;
 b=XsrAyl66w5/CsAoKMjEQAOMixVtwaOHBepXFPpntSerC+uVEbc1X0mgMZZyHs4Omo21beWXe
 tFjjZNmCHCjzzcXYrttOYfACokYAO31Cq29BZ2iwF0kn49DRL7vDfZsMSxXWpXVWcLXtExzqlTr
 4vM9gsK7DOWOIHapNrUeNgq0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aeb8575d513909ee;
	Sun, 06 Sep 2026 17:20:21 +0000
X-Mizu-Trace-ID: aeb8575d513909ee
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so4111e87.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 10:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzoercAY/6QFWTXEjwfImn6kDYEPBM57+wFWLuP3cgd4O8daEyzQBA0wlZT7x3PStC2uJpUTk2nYDd6y/wht7o=@vger.kernel.org
X-Gm-Message-State: AFuF++kEImGjtY/rPxbzNJYNqUN2qrsy5cvWxrbAus9ZkJ4xgxoio1yH
	FdDgkoTEUuRHQTctYENiBu504H2dwaALMXeNgKzA/Sg0l+1mwOBQP5e86/2tO22FwuFKCGrsh3L
	KgXKsGYedac/DmvBklCV3a7iE0yDhy1e7JtBR4mMA
X-Received: by 2002:a05:6512:2385:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b74d44acb5mr105182e87.9.1788715216132; Sun, 06 Sep 2026
 10:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904175550.430266-1-dongli.zhang@oracle.com> <20260904175550.430266-3-dongli.zhang@oracle.com>
In-Reply-To: <20260904175550.430266-3-dongli.zhang@oracle.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 6 Sep 2026 18:19:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzjDysJXhuFTyRdmh3Ds23r+S+SNghUH1RYpBfwHFTJWQ@mail.gmail.com>
X-Gm-Features: AcwNN1V6wsRuawKeQC5Yrt6FrQGQC2xcq6Of0g2I-XUsUdx59PQhL1xhMAbXFWM
Message-ID: <CA+EHjTzjDysJXhuFTyRdmh3Ds23r+S+SNghUH1RYpBfwHFTJWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: Reset last_steal on vCPU pid change
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, dwmw2@infradead.org, joe.jin@oracle.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 18:56, Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
> KVM does not support vCPU hotplug. When a vCPU is removed, its
> corresponding data structures are not freed by KVM. Instead, QEMU destroys
> only the userspace state and the vCPU thread, while the KVM vCPU fd remains
> open and parked in QEMU.
>
> As a result, vcpu->last_steal is not reset.
>
> If the same vCPU is later re-created by QEMU, last_steal retains its old
> value, while current->sched_info.run_delay starts from zero since a new
> vCPU thread is created. This causes
> current->sched_info.run_delay - vcpu->last_steal to produce a large, bogus
> value.
>
> Fix this by resetting vcpu->last_steal to current->sched_info.run_delay
> when KVM vCPU PID is changed.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
> v1->v2:
>   - Move from kvm_arch_vcpu_run_pid_change() to its caller.
>
>  virt/kvm/kvm_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 65eb26a0520d..784f0d945b45 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4478,6 +4478,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
>                         if (r)
>                                 break;
>
> +#ifdef CONFIG_HAVE_KVM_PV_STEAL_TIME
> +                       vcpu->last_steal = current->sched_info.run_delay;
> +#endif
> +
>                         newpid = get_task_pid(current, PIDTYPE_PID);
>                         write_lock(&vcpu->pid_lock);
>                         vcpu->pid = newpid;
> --
> 2.43.7
>
