Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30218C332
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673466; cv=pass; b=MBYD5vPXCCmKO83AUVZjMlUSFhnIrvN1PupHnEacf2JS0fD5SC4/TajK27n2Ik2alwWjS/yZcS3iYFCPnsC3Ha/FbrAKiuc7D9DInwgT75wJeumdC1MDQcD22hAsVlPOxnFdUpExNHOGXDk+g/UGB4dTQ7Ub65zXWFy/hMvhAAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673466; c=relaxed/simple;
	bh=eMelHGD3cdQRkDg51khj7jdfPOgIx10EdmbVBnS2vYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzPv+BXqX26RkG4tBdNXAE0rKm2yor4dsYwjxIQuqg8R0ddbknU4IPWK3w0AxQrrJXxeFBpVmzOdmJJJ8tKT3nGJdWIV7Duyz9W5UYdTlfLVl08Kf+X8iiDMw71SDMgIvcWbCZI5csOBa+zcxu3V9C48TzUnamXdB5X++Pnfito=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=duCt5yFX; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="duCt5yFX"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43ca73487d2so1700426fac.1
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673464; cv=none;
        d=google.com; s=arc-20240605;
        b=hDlp+zdUvl7P6DQB3vDd4CZAg0ycLN0Zl4p9+rQPsR0MLSTxTOto+kQf6yQO6QupUu
         c9j7GwNSgn9FVwC+xe01K4vC4fO9IKtN0AhHBj4Mx4/A7ydVEW0mNQOPo1gNTYbLC05c
         +3uQJ0/04wa5qk3UXU817cpJn8luIqX5NvarnJV6Ux7Rws8gDcqz1Di9sERTwuz2ntDj
         MO/yuSGaBrp2mI8wjQNUsmBbiknyctL9q4kprkJdfPSm5Tb8Se4aEUqlyA432d8caFLn
         +5FporZjzbgyPh76N/fTU4x35VQYVEsBkHegyZTtV83SMiyWD9PPZSOYVWFJtfbUsATN
         HcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        fh=e/L+23UwIGXD4Iir5tslvgM8lDAL5jSxl4HWpT8Cf8Y=;
        b=axc+uI7JwiuS7ykLeZg3pNUwzPSt67MojEJdLkzgg6wOXTYQaoZWgBBPFZhQxG6ZFO
         OKpXU3aJX86E0iZxDuIWIzubkomnxDp/zCXmqT2rtYshf4dzSQYn+pBk4F63KsBZte5f
         z6xTOuCPvS4ayE43R7gYxGkJa3skgaBNU8DII+DJuoUBsYFtnou254hpzxpbYBJozwre
         rNsBPEdrV4aDZNtYyTE5enf4Osmkgfr52dYF8wCU3hMsmvXapDCrhcaSPv3haXZFEqWP
         AdPCPqYjus2tg8iLLPGXRoiYLiDl/yiZgwZT9alTpbHUc8TTWe02/ot7O6o0W11DdNXG
         ZuEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780673464; x=1781278264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=duCt5yFXYu1pPhDZ7h0i0kxC3ArWOHaA7MW9IQX7D277BsppANKXCWoMAIF22gIngW
         MGwli/M4dRoKIz5w+wBJds2dieIeYOsZfoFIs0aIjAtHLfgEHCXOKxaCuzesMVZA4slo
         CnAa2qwH2x3jEGWFs/0akj4pREiSm6zzs3WFGyz54r2CMHit/B03QNdA1CdKO22t1ED6
         9VYlK95clnTL4NBLQwjVPy+ZwEGL7g4kAa5agCelFPh9E28WT6dFeNTDwR6YiIYQ9gUI
         l5PPwzT9it31YbK1UZ5qSpTCYFsDdkIx2JKJUlu7pttxHvmgRnWaAHqW81nPEG5RvBq7
         YfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673464; x=1781278264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=IeLETRpKtHuB7X5A562Wq1eGZ+UQLm+JoR7+xFujbHknAb2Qq/WqTUQs5o22+XQz3w
         N+QvDvAZDmZvNGpib76BJBPLXpEqfsSIzRfu+dID95FlYK/sI1BN5cEzsaGLLWqH4NVG
         9zqFt1x4q8M07fiOvNIqUb9l7/vakupLPtJfTm326Tgv7A+vzG4S2p+gt05XD6sPI9l2
         fpghSehP0u0Vdc/3gIfhovXdjZcGj9RezpTY0Am3nICcdnBgAMjLZh9UsRweZ5HuR11Q
         SGOfmPnZVDs2AIimI4Ow1nS2gq4wBkVr3ObBIPRA5kdfGRBdLuI6LnjbuVewzH7kvMMJ
         mftg==
X-Forwarded-Encrypted: i=1; AFNElJ8oBG3Wqp1F4ZQCOfzES/QOuvlYvfAzbM+rm/11KN60xiZNp6tMmgkcbm1/CKlh+zqmPBR830p/UtAEMz9X1TM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl15vhoJoT5zTnLRcyFXwTo1M/3IDi4ZbJNa+TLkd8I+AL1EQe
	PC3saAbPljGsdX5GtMSpAp3CbjsnisHFUyRTUBMqsSKjxrowjQwuz04IZBo42bn+dSdXP9yeAss
	1cUwZ1FSyCaNlXQdCas7b9ejR63wzcwXCGwlq+2xPhw==
X-Gm-Gg: Acq92OGyKVxmho3gmBzhiuaTtbhO2Y3BL0nIMSSW+AwH0ozjBOnN4QtZX6xWxxAPxT9
	qfWUhHzVnqJ30qHG8P5e7OhNNZVatmdkJjyA/4qVmp3KKi9cedIy3MVO+TlQcT/0rCq7nrhoGCn
	dd5yJLkngc9fre4HaYdaAdF9VxXAahwflj8V4Pfx3k4edDnZPN2Tg0hacDGGyVvV9dssu8dMX+z
	oWPwAOLJ16qnlDfs+MfcqBUKufBRPZmRio9gDfs+nRSupFh1HwMkhxohJElzCH1obRTnAxLk1Xi
	Eovg+IQ6Dr7gnmWCmSakg9rOXs1BalWR3C6LeZRAVGlCMY4ejsq9brK/ZEnBM/KzhMebPOzOctF
	fGvtxhIu8yk8pEAyAVpg/EghnuY1CZzFp1kJc
X-Received: by 2002:a05:6820:570a:10b0:69e:7061:1ad7 with SMTP id
 006d021491bc7-69e7061218amr765816eaf.11.1780673464357; Fri, 05 Jun 2026
 08:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:00:52 +0530
X-Gm-Features: AVVi8Cce39tEXaZNh-7VPeh51marCJL4-w1WK5dzfxiMGfPYAU1071UHao6Z9nE
Message-ID: <CAAhSdy0m+ZpxBznL-gx5ozpbyLzU7rO6zZnnB=5eZt=eLvV+sA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after
 setting feature value
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:56=E2=80=AFPM Yong-Xuan Wang <yongxuan.wang@sifive=
.com> wrote:
>
> Mark the vCPU CSRs as dirty after successfully setting an FWFT feature
> value. FWFT features may modify CSRs (e.g., pointer masking modifies
> henvcfg.PMM), and failing to mark them dirty can lead to the guest
> observing stale CSR state after vCPU scheduling or migration.
>
> Fixes: 1323a5cfe52c ("KVM: riscv: Skip CSR restore if VCPU is reloaded on=
 the same core")
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index 2eab15339694..5e4aafb0cbf1 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -521,6 +521,7 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *=
vcpu, unsigned long reg_num
>                 break;
>         case 2:
>                 ret =3D conf->feature->set(vcpu, conf, true, value);
> +               vcpu->arch.csr_dirty =3D true;
>                 break;
>         default:
>                 return -ENOENT;
>
> --
> 2.43.7
>
