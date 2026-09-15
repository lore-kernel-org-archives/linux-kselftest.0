Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA62233947
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430525; cv=pass; b=pOvuoQKxFk709Iy5/g0k+OpKuw8l/VnUHpdLsmxSH/c8cB4VfI/m20gym0sD4aCEkewGi9ayjcD5XA9txMofUZmcXUxxmW7DMoOWr8LYJEpiqQ/GPgtKza0etyDwcRfFOJr5g+D8GI9etQswyYYyJDjQa6+vYJ0ZXEy1VoBJcdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430525; c=relaxed/simple;
	bh=eosAoihtwAOEQJyRlv6Vl6Ciyr7ALICvxVxfVC6AgmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqKmuXxxYnvmqV+2sHVTJhpOvq6ij0fPVgbW1z/2ofmBEWT8pgNRG/Jo2jbZwvf1W7T9LYKeHUew28UIzhL4ikAUj1P98e+y4RNX9rGlQ1xph+RbblfGgm6N9LYdrNeXmgU2haDWlRCeq7PVeHgiEodAL1A+KTTI12R1rh1wm0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NHezCk6V; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NHezCk6V"
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CDE133F339
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789430518;
	bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NHezCk6Vot4mOEr0muRzuwZ3RESXVja7HmFQJDjKq58ulO5ypCFrJEFkoWpHYNe6M
	 O4IJ3BEw1zJ5LY0qatQ1rw7pwz/8xqhAkeA1oXkis9HI3HrfY2SDJk3meVC0jKwoxD
	 vicl5xtIh/mfKFKi04JDyva+kEPd5Wvcyt9iCAuT3/Rc5nB3WSeWK613nobzx+9xDm
	 e0brVb/14AYq8afSEqqOPcgtLMNvKILI0nVCE+uV6ofoCFbQj2wEJmXn8PrpeIC56N
	 kpEM/0mf20B/2gtnSRIh4yJmULAchlMGgzOSxCz7ETGSZ7LdfwriPQrHGsI63lJfNH
	 /BQynQEI0qUJdeeDvSAPywdalNciJr4m6c1qOU3zow0wiE3DnNpFXYLR8R/sX6dXIl
	 gxSA7Lc3Tw/TYGjHyEeXzbtT2GsPLsukuhfIj3pyq9ezWeibEr13EH1Q6Sgg88kdVV
	 DEloh8bd0SeeLAyk4l7kREWji75yOZwU3gGAzUnY3clFSnPlTIRPfUR4m+AZ8WTUwI
	 sXhgN+uGjt0lZ4Xa3fj2IKOFRPfdWbYnndsOu6sWqDQePsmTXdOiJ2nsumaJJOcAtZ
	 xbxBPLesvKf4I0dyoJIBm588+bbxMdb8P8HYb71tJgylISkBn17kS8F4powsBWEO/u
	 ohrtGN9xAVqxhIUS7TqST+rc=
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66e44d96aa0so3909835d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 17:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789430518; cv=none;
        d=google.com; s=arc-20260327;
        b=pBqpV8YgpqQZvNW6i6AacC1pJ38xdMpPhtDXONbLnUXvcEScIvaNiDZz0tFJJaoq9A
         I2ggLbt1qbYjtmO1N2iXh5qNO57XpXF1Z0TAWSgREez0WQYnd+JDb3Zpo0dSmnPiygrc
         Vh2t7/RmjeoaSreGwEiAY4cgc80+4I53Xmhcs5BSO2IsGVJ1O30rULSB/B/bKdefZFVa
         vg36G0sxinFdUSclmmMi8ONEqz3sGx3O6WIJWcaZBP7FYE6XDKRSHKtMVQ54ieqdWqym
         8iRubJGWscfiKajq8d7nhE3G0jLioGe54ic+5XcL3+8oECq1tcODrLNM1JyN77D9IhaJ
         zexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
        fh=AO6+6Bjwm9kUUll9l73R4D2JTFI5NUJKjC3D1SGMlYg=;
        b=l/2m9MA0oP9sg76AXURiF48WAt+i5wo7qSziymkDzQ+IV/KIlCPo814Pfal17xC4iB
         +hTazSexCDRvUT2ntfmZLLTL6pY3lk9/Mn6RODXyFL1yy0zPk39QLNWI736DsVdlzyN9
         QD+uFIWCWazHgwn7XNy+bHKI3t4E6or5ZzlS5HyqHNGmiIvvA97wLU8OdgFIq5JytG4V
         fvFQ2Nt8ah302bMa4Ox5Ql2gQ8WgeNjnJV9IpNLHWokoHkSfjaQUQLpu7Bz8a45TuMfH
         8t9mgk4ClUp5DTcLS/Y3zF3Uomayfq1TsXsGnaX0sodzL+SCwuahS4YKUFziuLK4McLB
         cSyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789430518; x=1790035318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
        b=W8vxgBwIBOqMiVFvCyw6w2Gdwg522drr+unaEVIWFHJe9ZrK5D5iITvq/y0XIfKPgF
         LYOZnHocC5Hz/2qY4/4NDYGGL9B86UTzkATZyySAv8F56bcdeuKvuzkUzbB95r1UybED
         D0BgBgf8WpPyuEnldVzRaWFFvMn16CTXdgXTGRkgCho8nYYPJYYBwq3CalYl6993un7x
         BzWoHyCX2TV13XFE6Ww33KmflNC5mvAT/0Z2coRzvvE8iKBnZxrUMLE4vDbsrw1JS6zj
         FRPibsAWs1obGoEP1NjGLV8GOcW89Z9ric7nSBxMMlv2G+hEBndAM1YDzXghb0LeJmq2
         7kWw==
X-Forwarded-Encrypted: i=1; AKwUvBy1X5H5LqR8tFgA81mgfuj0wT5tlqRsJ/ag5viYU2aABd9r0gXXMW1FjR9tIB9yV+g99ylb1QBNwrzLIQLoSEk=@vger.kernel.org
X-Gm-Message-State: AFuF++lG0uqiAvGX7CyLjKfBN2ngyVKJdLu4A3GNbzs98LhYIWEzP/4Y
	yXQWTbxxF+jWx/Vlfa5gpe6wDlxVRd0gEsUKeLlhdJUoX6Jtx95dh2FLRlY3eVl5wUYfcIgxyUp
	eiVLeLUzXT9S7FBJW06FT4Gm3waUiTVX/HdJULE6GEZCkRSxtxwgPF9pI3ThxyubxG/Vgjfe37c
	+FXdKUUL5Veb/gcBJKLxjMVrChG2ebF5fdkjuIGRnkP1gGIqKIlHHXotnpNsc7
X-Gm-Gg: AYBFou1e2Tx/fow7bBFAO9Xz8JO9kgukKa/FGY1YxkAdLrg6LY5RUU6ngAZIhVoU5Z7
	bBlANYm711V3QhcQgomH9TEQLoHrbOr0TzXypOrCY/JQig1zJsZgTdep4moTfqXbcb8o5h2OF2j
	voH06j0ITnqteftvdAxH92+B65jaKjLuy6hSmQM0VPv7tBM4+4/pgWbk9HC3tDkXVVRwJbd23Fd
	xgv
X-Received: by 2002:a05:690e:108a:10b0:671:548e:f17a with SMTP id 956f58d0204a3-671548f09fbmr575139d50.6.1789430517559;
        Mon, 14 Sep 2026 17:01:57 -0700 (PDT)
X-Received: by 2002:a05:690e:108a:10b0:671:548e:f17a with SMTP id
 956f58d0204a3-671548f09fbmr575131d50.6.1789430517076; Mon, 14 Sep 2026
 17:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909050919.3344699-1-chris.chiu@canonical.com>
In-Reply-To: <20260909050919.3344699-1-chris.chiu@canonical.com>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Tue, 15 Sep 2026 08:00:00 +0800
X-Gm-Features: AcwNN1XVh1ezSC4ybotZKbIiPQmqAdnlb_DFgEiPNeX7teBjdDq_YCIHyZaRa4Q
Message-ID: <CABTNMG0+rpiqAckYqizUQHU_9rfdt21drC8Y5t1SmOonwYGSBQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
To: maddy@linux.ibm.com, shuah@kernel.org
Cc: sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:09=E2=80=AFPM Chris Chiu <chris.chiu@canonical.com=
> wrote:
>
> Hash MMU maps execute-only pages as readable at the PTE level, so reading
> from a PROT_EXEC-only mapping does not fault there. The exec_prot test
> currently treats that as a failure, while the rest of the permission
> checks are still valid.
>
> Use the existing using_hash_mmu() helper and skip only the read-on-
> execute-only subtest on Hash MMU. Keep the rest of the test unchanged so
> the fix stays local to the unsupported execute-only-read expectation.
>
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  .../testing/selftests/powerpc/mm/exec_prot.c  | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testi=
ng/selftests/powerpc/mm/exec_prot.c
> index db75b2225de1..bd44f49d8449 100644
> --- a/tools/testing/selftests/powerpc/mm/exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
> @@ -108,11 +108,14 @@ static int check_exec_fault(int rights)
>  static int test(void)
>  {
>         struct sigaction segv_act, trap_act;
> +       bool hash_mmu;
>         int i;
>
>         /* Skip the test if the CPU doesn't support Radix */
>         SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
>
> +       FAIL_IF(using_hash_mmu(&hash_mmu));
> +
>         /* Check if pkeys are supported */
>         pkeys_supported =3D pkeys_unsupported() =3D=3D 0;
>
> @@ -167,13 +170,17 @@ static int test(void)
>          * Read an instruction word from the address when the page
>          * is execute only. This should generate an access fault.
>          */
> -       fault_code =3D -1;
> -       remaining_faults =3D 1;
> -       printf("Testing read on --x, should fault...");
> -       FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) !=3D 0);
> -       i =3D *fault_addr;
> -       FAIL_IF(remaining_faults !=3D 0 || !is_fault_expected(fault_code)=
);
> -       printf("ok!\n");
> +       if (!hash_mmu) {
> +               fault_code =3D -1;
> +               remaining_faults =3D 1;
> +               printf("Testing read on --x, should fault...");
> +               FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) !=3D 0);
> +               i =3D *fault_addr;
> +               FAIL_IF(remaining_faults !=3D 0 || !is_fault_expected(fau=
lt_code));
> +               printf("ok!\n");
> +       } else {
> +               printf("Testing read on --x, skipped on Hash MMU\n");
> +       }
>
>         /*
>          * Write an instruction word to the address when the page
> --
> 2.43.0
>

Gentle ping.
