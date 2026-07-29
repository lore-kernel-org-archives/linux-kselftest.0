Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A75411A0D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338612; cv=pass; b=ftc+/v3UdNd2Pf0N5e1UwV8Sv4SQOzdGxzOuBfdXbUoGwmlgMs6WKc39F1Da7Er13V/nuZJtZkdvEveWJsqMvYb9vzwyFTtNpFUmPJ9znYELyIrXaEV7p6KsGXgHh/Xx8uoCqKWzV4D949tRl6+VJd8xn5seHfIGoHuM6t4vhao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338612; c=relaxed/simple;
	bh=LVBzsbGMtEvkKYlB4ymkqikHz0oYkp14Iw5Po3+7C0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxaaXUD4cOwRwawrMwKwYc1kGCs32dR4X6An11dFZhQwW6G9d6SnG4e34RP1WyPO1s0JZxCIxz4In1DgV65XLArA6qMR6OXEXdd82e0acz8Bu4H26KWnvQwenDcVC/5B9FMLIelnDaJs2YWIKeVwQcUUn3n/iEOTwYuCqzKyfJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aGp1RfGH; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aGp1RfGH"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c10e86e52so281541cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 08:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338609; cv=none;
        d=google.com; s=arc-20260327;
        b=UeJQCfuVSSwel2IPc6aX95KSr79p7XjVfzik+5XzSY7aNU8JEktnO9zOQDxiIiycgp
         9HZOM4D6dvB+iJqkENE/1Xk+RoHMcOr9dvgoUp1mlhWCvgzzYs9drJhkEYqAlsAKmoob
         Vx6gicWVjuWEZfl/WRB59fujcB6fyHo1FsGva+4DmCPPfr+xIDbmUcZ4q5sDTvHhAklQ
         R2t/BHk0+VQByFVkKBME7s+lzK791MdSUKv+2BkbeixvhTR8ZS0BVY+wX7h9EdW+TgB8
         dwwVN/E8+tbxqzaZ7fP1V1vBsMcgS+RtDBVGjU/Xs6PRH710BKa1/FCTtaEEY7DSr+eI
         RIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        fh=VfHqN+yCV0tLdjHJMK7NCvO8ufXYORXEkvZUJCouyz4=;
        b=hRkjlqNkVukMnZvcHc66KtZYZxaJmc+G1eeo93cd2585Yxzm6zZ2QQQHqfiUHD8hvY
         65u1b6LMjzWlIYgm8w6QUaF5EJuyD8QzWMpqPUtOKHrh/ppakx4CYyDKe90OVs9lriuy
         wRYPHkduTj7XTy+jN9RI9ubBssg5L3uv7dau4mFDRGqGXMzsoQ9xVMM5Pu51FMuE+/IW
         Tiq/7jxr3HC6t7/REON7JVi86V8Ju9gRpig7fAMP9eT1OW+ZG5zoM7zgP5oZ4Wv3k39r
         4c6AMcuZ29Wc1I9nIq2WH5VkfERfr1xvLXZTUypEWdn715sRM992yznsvpz7DCIjUaU2
         lspA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338609; x=1785943409; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=aGp1RfGHDlZ0hE4muYzIy3nsHjllrhLfyxOgl9wIAwWgbWxY4eJL9CwgYJd3H9+CD/
         YqXHu9a+ynMSeJvf4Sc9dm8G66UZRRaP9FoSI1sC+9iwh7gZFG+8ama5NPrT7BeAKAju
         U+kjvu1B8GLGc0vIPfbyODcHWSfy0aldcQU/uuDkdtMnse9DkxBQ9j7Bk75Hx/QpYFYH
         TNvsOm3aW30rMhjPMXRWmldbn6RJQVT++j6SQmLngVlEexYmTQ0raoeZIcZelPhY7C1k
         wq+nm0wg42/YwUWOOQYY11QH3LzJeaUA8x7nP8Ehr+Hfs9XxGw+4MaRX5q7xAeUGSCH+
         mrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338609; x=1785943409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=rzY/sSr3HAHQJsz6T7hDKTZJI37UPdzeGGRyOHRY/dhYrp/xXKmZ49cggowfjKYrM2
         9PgAEeHD4G8NgxrA3U5BCnkpSQmGj0oCRa57hvSLSlcQIpTLCpHNrj8UQIicq9WuGAiw
         4ueV7pizcusMK7ki/oqyujXQbgLGdtWHaU+4PBoaJwLIFUYAhJzKA2NY3wGei565Vlg1
         83p+XsuPz8dP1Yfh49feasviYe1MttYP3e58ZkVKMaVzWSL7E2RobGtsHfJGtRtbfEWE
         uU717fZL5HnnjU/zZ0M4SNivr0NrC5/O8L0uFZ+NMq1TVi8HL+5z+m3JAZXzyDklaT4a
         FaXA==
X-Forwarded-Encrypted: i=1; AHgh+RqEjvvK3zAlUWeaMsFe92MXZHCnjbPdP6jBkrrZ3Pp1qgwSZNn5ynutKJSn1t2vswsxIOVagv9MdOUixNrc8+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmp5yA1LrRmQEfGVTIIwO0l45zkJpwVY4JY5DAkjrD7XCZuTsm
	s9uhZqjK83/7pKUFC4Lb9iwtj1ZeFQJHmKQbdzf7+QeiyL3nJWMR4qcFAS2j4zBz2F+l+5Avf8A
	qmPxRkAdp3CysW3hom8IzvMeKyu0pR9v7XF+JyZhm
X-Gm-Gg: AR+sD12nraz5YSDJgtf9gC4vIgo3FfByys4pJSMvdVzt5WfJBpHokN0HxTA+EUM9SNT
	2jhwHssXa4gFtSFG5R13EtNguumE/Juq28kQOidjz2oKeT9w42hKCbAA46YaMuNt9gjJkiuo54P
	kgIJBCCt8iIRvzhCM2jTNyq2TVAJSGdjEeafDAyQOsIdW7DRnBEQ8R7auu8R76kniPtQ1tIqEgL
	Dg6AqHMZrt4nemDdvYCr48MhuI5+hP9W5OCArFBeeiqVP/3geUZHzkRFjIPZmFOMuIRnp4iJfDe
	gwCrLZbm5mbOOMbrpD7J31iLfOoXoYoENat2bCkVfGHoV2kS9n+unehHgwyNtS8VmZI9fVuZx7e
	VogNkK8wVxA==
X-Received: by 2002:ac8:7c56:0:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-52b35089837mr565631cf.8.1785338608520; Wed, 29 Jul 2026
 08:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:22:51 +0100
X-Gm-Features: AUfX_mwUs9MTXlZgLAxa7rxOqn4AEWfpGlzGWJmBR-6Vw5CXw5g4z3qo-EMbdA0
Message-ID: <CA+EHjTzwDrP=3a7f38e2H_H1YPV0igRryhfuNCigZQUFy02tng@mail.gmail.com>
Subject: Re: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Add a regression test that runs one vCPU and then tries to change the
> VM-scoped PMU counter count through an idle sibling. Verify that
> SET_NR_COUNTERS fails with EBUSY once any vCPU has run.
>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  .../selftests/kvm/arm64/vpmu_counter_access.c      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index 22223395969e..3b5bb421f401 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -461,6 +461,11 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
>         }
>  }
>
> +static void guest_code_done(void)
> +{
> +       GUEST_DONE();
> +}
> +
>  static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
>  {
>         struct kvm_vcpu *vcpu;
> @@ -622,6 +627,37 @@ static bool kvm_supports_nr_counters_attr(void)
>         return supported;
>  }
>
> +static void test_set_nr_counters_after_vcpu_run(void)
> +{
> +       struct kvm_vcpu *running_vcpu, *stopped_vcpu;
> +       unsigned int nr_counters = 0;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vm *vm;
> +       int ret;
> +       u64 irq = 23;
> +
> +       vm = vm_create(2);
> +       vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_PMU_V3);
> +       running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
> +       stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code_done);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> +       vcpu_run(running_vcpu);
> +
> +       ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                                    KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS,
> +                                    &nr_counters);
> +       TEST_ASSERT(ret == -1 && errno == EBUSY,
> +                   KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +
> +       kvm_vm_free(vm);
> +}
> +
>  int main(void)
>  {
>         u64 i, pmcr_n;
> @@ -630,6 +666,8 @@ int main(void)
>         TEST_REQUIRE(kvm_supports_vgic_v3());
>         TEST_REQUIRE(kvm_supports_nr_counters_attr());
>
> +       test_set_nr_counters_after_vcpu_run();
> +
>         pmcr_n = get_pmcr_n_limit();
>         for (i = 0; i <= pmcr_n; i++) {
>                 run_access_test(i);
>
> --
> 2.55.0
>
>
