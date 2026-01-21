Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47C413235
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031225; cv=pass; b=j4O0CI9+Mp9jgTTDKp1zJQC9xEvttHx5kd+zo92GWV8/VD6ECKaYKbFh/8T12x9XyE5Cw2SkzNhyDUxupiOlhMxMX/gvYeWW+KZvQra6MNQuOlYBlLUKK14e5URrxZlHKw4sP/GFSWflLJPUgqCHQsp4QD5mEBeoVTBYiRNLnr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031225; c=relaxed/simple;
	bh=7LNNerLe057eSYdgqCBjUjECTEIyT7Bci1xjPXN3FEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUVHtnkwB4i9d+e2SKi5dUwr2GakIUuExWfnfaVEVii3cS0BryJQRRWDp4TCn5MQ3sOnkiGrNj4hUUOvoMmYv7UgQ9sRSBnr5eA55Q8KuQ78JEoi2CE1b7DmdZHJyCL7P68E+mYJk5wooYqTqw1HmMPUNXh70UpOJopDZIq8OjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A14PcRnS; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A14PcRnS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso411850a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769031222; cv=none;
        d=google.com; s=arc-20240605;
        b=azSLxYyxQRicKaDVCNUHkkT9roVKsLuWQJC1LU4+txVv0pKtW+YcZKmOidog8GC3yq
         44rRxoRZfapUSpQUvL6Cfq7Zu5nqSRcEkA8FJS68PnF+zFbiwAB6kKmKgmQln8ew8aXa
         QLc6wI64IPsj9Kn1QrKLWWD81absY8DyYYhvU6zgy8ylf0rKSVZBaExt6WbAEijRinHT
         ckCf5R2QxbV7LrIO813ozAuzrJNFb0WcC10MUH6hWFFFUXyVsWosBHW9n37hpTGWHeiQ
         wHgfj125DBaCt/ItqRVx5B4rLaxjiS7h0TyfBJq0lHhLvtwrHWOiQ8U/LQ7gDMVpLRyn
         limQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        fh=IMNJCuh8a+x6SxcpL2uCGiNogpN6pWcQJfSzRsh8ivs=;
        b=kiOziADNSVgy59krBaq9bW3m6opktMCqJCQvh8vRynJqSPb3sIDX/PYl+fZJAnQXA6
         Ll9QBWgBzUkaTPbL84stIKH11kZ2GOeZRoL7PNTL9B1fSoYD69YXOXRvQOMTdVKmbxZH
         BF5fn139skAEEdIJzkB4gvzC3ZyR1mucRvXmiyMNlUcH5wpK8Lyp8+Ob0MdcY5zGQ8EM
         E7weMOLW4k78hQy3ywZLcN20vJ8dQDIAuZp+elpMPuIwq2vbxOxpn9vj3L27eR8lsAUb
         BXXrtJds13kANb1wKltvBNW9HTCdDXehf52SaFNqHxgM69OXtG8acXgZK13QC1escria
         UtMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769031222; x=1769636022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        b=A14PcRnSASlSNu4bLj0YrrcF4stYwizYMo1nmuah+wP9la1zmhYh7zAR8PZ7rHwm33
         bXnlO/hYp6DCOzdlqChDOtiQj05HM0eBF7DNk7cXMvjtDUgW2lEZ+5P8MI+2XBRoYzib
         T4ICVQMls2QWSxQG5ANuaeY+L7LbOvhzTd5PngIGagFuzqvULD9nZOSB1T1e7Ji+9JwV
         5v0wHmBy18Lt6F4FZFj+93gCFDi5wBKFUoD9VCDRzpxnlESf0WciZjUFuxCfPWOIiQUH
         4x5XnTIO3k0T03TmF84ozXFMKBs4Z6yYXgKtuTBOujdd3h+jx4w8mSjPOK0xvOoQ/ddb
         KCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769031222; x=1769636022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        b=i/Ess9GU7RKM8IWmO/wW4MWnsbkTKObjDIQXV3qQDHq3Kw3xOKnfwuRVNDY6E4v5KF
         d9veNl8EY962JAVGI0b2ezI0UrwdvDUOfJRO+BYcWNUBLnDJVwyCPe4gKDGb/Znr369Q
         LI0zQWRjIbQJC3C/FnXSC5yk6vIvCckJRs5MjWCoBBDwVkJe6w8i3O3OtK+3r9uLEhoO
         YWq40c1NqdIeC73kabauR4aJepq47qISzyraiQnmY5+eVXXyYsnAVepK/bzr+sApTNEk
         K7e/7wZxETQFsLnvI/ng+VNvCgYlbhC6rzgHskZxGFcfdDbXaC/H8xlNTKyKmF9Tg3g0
         Yn/A==
X-Forwarded-Encrypted: i=1; AJvYcCUyfzpBxNQSZwerJHxm5ZEWBMr+10KRc52e08VRomfUiK8zJI3TtFY1NxejXVgRQu8A9+lqUeiOLzkN+4ZufYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywudwhv79IKwzN8tdccp8LoZuK2Q/hwFrM7FsakgMJ3X9jxCjic
	M3xp7/DNoXAbNAY8IH0+QIn9dGWQ7X4QZQIBY6K2TYGiUq49mKTJ1k6crOl/W/5bJel+6x3xL12
	mqTAxeEwDmA5jpjKkipoX/vRtsyH0iFnjuW1tsPE=
X-Gm-Gg: AZuq6aKUWZ4k0HUuvdx9d95he8zs9CVjgJ/St/lDCC7n2ntLe4n51dyKQoFFfXWg9JJ
	b2cEWsYvpZNBluCIjRqUA6/gYesd9NN80j0b0zV2prBiTbgIxOwhZadHq9YGdt0AmFJS7T/JGvU
	zNRtAz4AXhNdAZ6OXMGdFEJBy3/XR4KpXIgOJmSP97okYwq3KXV3nKoSu2wq3rJtbLI2db/pADM
	XarMGLVU6yzmbpbxsw6yz250FoEoAjAj8imnqqNYv2ej12AIna5OGDqdBhP34R/FdTl
X-Received: by 2002:a17:907:97c4:b0:b87:2d79:61c with SMTP id
 a640c23a62f3a-b880023667fmr540373066b.8.1769031221404; Wed, 21 Jan 2026
 13:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-7-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-7-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:33:30 -0600
X-Gm-Features: AZwV_Qh3bndCXU54sipWubfknrF3sYKBLBuqCLOAnsmX5JPh4z1Wyf_sbCt4Tp4
Message-ID: <CAFTtA3MQnF5NK3q2+kt_VLC9QZ=gDHE8VFp-aOznu+b+=62jLw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] selftests: riscv: verify initial vector state with ptrace
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sun, Dec 14, 2025 at 10:35=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> Add a test case that attaches to a traced process immediately after its
> first executed vector instructions to verify the initial vector context.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  .../riscv/vector/validate_v_ptrace.c          | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>
> diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/t=
ools/testing/selftests/riscv/vector/validate_v_ptrace.c
> index b64986b42270..a8d64d351edd 100644
> --- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> +++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> @@ -13,6 +13,9 @@
>  #include "kselftest_harness.h"
>  #include "v_helpers.h"
>
> +#define SR_FS_DIRTY    0x00006000UL
> +#define CSR_VXRM_SHIFT 1
> +
>  volatile unsigned long chld_lock;
>
>  TEST(ptrace_v_not_enabled)
> @@ -77,4 +80,136 @@ TEST(ptrace_v_not_enabled)
>         }
>  }
>
> +TEST(ptrace_v_early_debug)
> +{
> +       static volatile unsigned long vstart;
> +       static volatile unsigned long vtype;
> +       static volatile unsigned long vlenb;
> +       static volatile unsigned long vcsr;
> +       static volatile unsigned long vl;
> +       bool xtheadvector;
> +       pid_t pid;
> +
> +       if (!(is_vector_supported() || is_xtheadvector_supported()))
> +               SKIP(return, "Vector not supported");
> +
> +       xtheadvector =3D is_xtheadvector_supported();
> +
> +       chld_lock =3D 1;
> +       pid =3D fork();
> +       ASSERT_LE(0, pid)
> +               TH_LOG("fork: %m");
> +
> +       if (pid =3D=3D 0) {
> +               unsigned long vxsat, vxrm;
> +
> +               vlenb =3D get_vr_len();
> +
> +               while (chld_lock =3D=3D 1)
> +                       asm volatile ("" : : "g"(chld_lock) : "memory");
> +
> +               asm volatile (
> +                       "csrr %[vstart], vstart\n"
> +                       "csrr %[vtype], vtype\n"
> +                       "csrr %[vl], vl\n"
> +                       : [vtype] "=3Dr"(vtype), [vstart] "=3Dr"(vstart),=
 [vl] "=3Dr"(vl)
> +                       :
> +                       : "memory");
> +
> +               /* no 'is_xtheadvector_supported()' here to avoid clobber=
ing v-state by syscall */
> +               if (xtheadvector) {
> +                       asm volatile (
> +                               "csrs sstatus, %[bit]\n"
> +                               "csrr %[vxsat], vxsat\n"
> +                               "csrr %[vxrm], vxrm\n"
> +                               : [vxsat] "=3Dr"(vxsat), [vxrm] "=3Dr"(vx=
rm)
> +                               : [bit] "r" (SR_FS_DIRTY)
> +                               : "memory");
> +                       vcsr =3D vxsat | vxrm << CSR_VXRM_SHIFT;
> +               } else {
> +                       asm volatile (
> +                               "csrr %[vcsr], vcsr\n"
> +                               : [vcsr] "=3Dr"(vcsr)
> +                               :
> +                               : "memory");
> +               }
> +
> +               asm volatile (
> +                       ".option push\n"
> +                       ".option norvc\n"
> +                       "ebreak\n"
> +                       ".option pop\n");
> +       } else {
> +               struct __riscv_v_regset_state *regset_data;
> +               unsigned long vstart_csr;
> +               unsigned long vlenb_csr;
> +               unsigned long vtype_csr;
> +               unsigned long vcsr_csr;
> +               unsigned long vl_csr;
> +               size_t regset_size;
> +               struct iovec iov;
> +               int status;
> +
> +               /* attach */
> +
> +               ASSERT_EQ(0, ptrace(PTRACE_ATTACH, pid, NULL, NULL));
> +               ASSERT_EQ(pid, waitpid(pid, &status, 0));
> +               ASSERT_TRUE(WIFSTOPPED(status));
> +
> +               /* unlock */
> +
> +               ASSERT_EQ(0, ptrace(PTRACE_POKEDATA, pid, &chld_lock, 0))=
;
> +
> +               /* resume and wait for ebreak */
> +
> +               ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
> +               ASSERT_EQ(pid, waitpid(pid, &status, 0));
> +               ASSERT_TRUE(WIFSTOPPED(status));
> +
> +               /* read tracee vector csr regs using ptrace PEEKDATA */
> +
> +               errno =3D 0;
> +               vstart_csr =3D ptrace(PTRACE_PEEKDATA, pid, &vstart, NULL=
);
> +               ASSERT_FALSE((errno !=3D 0) && (vstart_csr =3D=3D -1));
> +
> +               errno =3D 0;
> +               vl_csr =3D ptrace(PTRACE_PEEKDATA, pid, &vl, NULL);
> +               ASSERT_FALSE((errno !=3D 0) && (vl_csr =3D=3D -1));
> +
> +               errno =3D 0;
> +               vtype_csr =3D ptrace(PTRACE_PEEKDATA, pid, &vtype, NULL);
> +               ASSERT_FALSE((errno !=3D 0) && (vtype_csr =3D=3D -1));
> +
> +               errno =3D 0;
> +               vcsr_csr =3D ptrace(PTRACE_PEEKDATA, pid, &vcsr, NULL);
> +               ASSERT_FALSE((errno !=3D 0) && (vcsr_csr =3D=3D -1));
> +
> +               errno =3D 0;
> +               vlenb_csr =3D ptrace(PTRACE_PEEKDATA, pid, &vlenb, NULL);
> +               ASSERT_FALSE((errno !=3D 0) && (vlenb_csr =3D=3D -1));
> +
> +               /* read tracee csr regs using ptrace GETREGSET */
> +
> +               regset_size =3D sizeof(*regset_data) + vlenb_csr * 32;
> +               regset_data =3D calloc(1, regset_size);
> +
> +               iov.iov_base =3D regset_data;
> +               iov.iov_len =3D regset_size;
> +
> +               ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTO=
R, &iov));
> +
> +               /* compare */
> +
> +               EXPECT_EQ(vstart_csr, regset_data->vstart);
> +               EXPECT_EQ(vtype_csr, regset_data->vtype);
> +               EXPECT_EQ(vlenb_csr, regset_data->vlenb);
> +               EXPECT_EQ(vcsr_csr, regset_data->vcsr);
> +               EXPECT_EQ(vl_csr, regset_data->vl);
> +
> +               /* cleanup */
> +
> +               ASSERT_EQ(0, kill(pid, SIGKILL));
> +       }
> +}
> +
>  TEST_HARNESS_MAIN
> --
> 2.52.0
>
