Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2EC348896
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804641; cv=pass; b=qqsu1v1bibefdsyjpeKFrL1BAqoDj08O5Tc+TVtcxwB3u6+yQAoF4YDz3g9D2ZJ5Xn4i/UZWSEYn4LmCnJLvK/tKrHpFpo5LnHVpqOp1ZE3p0GICmT8zVSn/WMfHurD0XJ7UiTwMN8DQTIvx7nDX1BoWp1Gy41WGheohRyquyMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804641; c=relaxed/simple;
	bh=LSbCuEWjDyxHHbdfWPZfE+rO0gwrV/np3QjQSXS/U6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TF6xXwlAnZfTA7QnDyDLxYYKfrQBEI+HSkDZlgOUb1SEX1/DnzPoZI/ttqL3yMytg+d3s2uhVAXWmpbUJLvDnBOJzGyS7NPBjNt4ofA0VQbRwx5PsGjIc2zF+4ottjTTfJVGZFi8pt8fTploMmTbYhO0a+Jsjv3+oytzpBsRZq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLEsjyh7; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLEsjyh7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so2307482f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 12:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769804637; cv=none;
        d=google.com; s=arc-20240605;
        b=F+67H+lIQmMdp9b4GXebqw/E/fk8ylvIWWihqGe1Q9j+jPSLGbWWBX07aXLIyeoXWk
         VWzHkQhWE5YWETubv0gGQREhy8gOXb/ro7RaVMQV8w/T1vqJN85VcNJ39fJegMGp2Avt
         4OtuFlZuVPvzYL6ghhv7KlkpvgxWm5Xle5YNPg+uQfGj1yk3nl70yjiUUNg1qnAjZRjz
         lRFVAfFUwPL1EPOJ+iIdC5Q7DmYYS7xl9a0ZDODFrZwhvT/4+Cj0lWH08Ita5RoBF8He
         1ZwqTek1iCjug3NG0cN0jEzu9wlsOHYPeT5Xbl1fsla14wkWJNqghqHhdOcJ+gg3yU4K
         /AOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBwlax1uJEe2vt97vaL600iF1Si6VhncixuT6qdHH8w=;
        fh=ENCnNN8apAiHP777UvMjArdAjiO290UwC9xbUbEFZSs=;
        b=TvAQ8UJ+ZS/jSgZgE5HEDbBgJM3eiOPo1CsVPPNP7S9me9h5kQ9RsnODDohSp/Q5cR
         /VOBfOoSUYAHeH8XNfANqsuxpxHh1g7DUSG5pfIZ6VbG/FzRSDfzPx5+SUsMEJLQ46TT
         yfkxGV6GpjqsUQFocsCwiDt/c71mflbeXLxHgwE6zihhcy42nEDDEuMUOhnBC9NTAdN4
         hZIaseDsgd9aqPrJIAghyvRH+MJbEoIMeOPnrHC9oJ5Kb7xFrcWt42lrPdCMuzaMc3/q
         tnWgnQTDVP5NMr72KYkYBV/aS4DFOCK7yLuU1PPpAQvdKF3+hQgpGPo6PUGzx7A0+3XN
         pT8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769804637; x=1770409437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBwlax1uJEe2vt97vaL600iF1Si6VhncixuT6qdHH8w=;
        b=PLEsjyh7YjlSS0F899rtagL2ikqRtbELz+YHhT0yeAVmVuV0p8O4qLA+X18scWUqZ2
         657TrGV9wNXSUcrtyY2PzFz3/w9wYboKvuOebx82PwNfVYbYh6zLkw2E56+JvfSeJiX/
         8f2N/nIRh1MNEmSEUwNvKqV7zxljhq8IQHOcH866kYaDyFjfWQHILs2ovQUZ6FNQQDjj
         PhbX/GufOmz/xK6eYwK5IIbPfWVvYGtUEblSRW/iVQjsGIWnVHzleTSJ56QlSuBxc+M5
         GbLMywtldptg1ZA4Kjxuy/FbLF4EhJcoFWs/TWEYlWYpaObgyqbLKvnRUgZLkYxlXelT
         5zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804637; x=1770409437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBwlax1uJEe2vt97vaL600iF1Si6VhncixuT6qdHH8w=;
        b=jmjkkNd+Lst3trEztWUPHvYQLXU2nUQdcarlGXEMR2pKJx7/s7H38I/ADZ+WsBSvSY
         0Nm43Z67p/ZS6cHu8icnnOEFRfr0aLbT1KGoi71WyNFRFUevOP/dx9KiCQQK/q8binPC
         vvVd18h8wWfc7Ye4CtKc71mwboatX1nWgmHnnwnvN1U1wLB793BNvQNGWu1M4dKbhi2g
         jaTeT+4wDbR1oDP0VX9c7U5aDgGZXknDX/qXO8aWj5WOqnPFrIH54r30KMHakk3sr9lj
         a8dBvqLrEcaEpi/EDj5EGnW4PA36jpLStp6lfDtrveR7Mcxcpa/HJFPbfEBQoSphKGc7
         QyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRV+Ws5HdslM9k+ofLoFJG0NVl+5/NudbTbxtkx3GWChXISwSGEBffYMJU+ZunlSztbu7A05qdFCVd0zlhYOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfkaFhCkplTiJM0UOvwT7ZJoiVXDeQDZ56cwn08B1BJD1J7ofC
	MeFXc4VHAhjXREnzOi+VecnUJiYBPJBSqNIS8S1ToPv5fqdAZ6/rKhf0B+jjdzGb9pq51YIk2ke
	HTMNqoOt15PeY1VXqQ3wKWvghpR4NAaQ=
X-Gm-Gg: AZuq6aJmUAFUZEo+G1CcyaHvBCaJAtVBNstKrAL097WTycIbfpmUvlQux2nYwSFGidS
	gamtNybpKlveALNNxJDy9PqNuMzMe4VUirooH92pGaI+3X8ZrAfIonHx2Yddo0gr8zNn3xslmTZ
	orvGaKVuCLXsMz8Nkwr7st9vNRSrr2GO6braIyYd+rklbiFfNEZtRacx67UhiKIffRjZH1+zAyW
	JsqLH9+83zorgsxjEkT/ovVObEU7ajuf0rjzhEvvQfNFyCLyJ29JFH8iGFCyWjg+0b9ZEaZVn7m
	8M6vxhVAhcegSIiJsKn681Ti9EoQfhro+VynZNOAOpl+yMcPtpi+dZqm2Kqp/BDuo6SR6rzVzH0
	Rpb4V6BLg35P14A==
X-Received: by 2002:a5d:5f88:0:b0:42f:b9c6:c89a with SMTP id
 ffacd0b85a97d-435f3abc68cmr6202323f8f.49.1769804636726; Fri, 30 Jan 2026
 12:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130021843.154885-1-changwoo@igalia.com>
In-Reply-To: <20260130021843.154885-1-changwoo@igalia.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 30 Jan 2026 12:23:44 -0800
X-Gm-Features: AZwV_QgVIyfECQMmhpFdjuibFf6ud4d60AK0JQfLZpsdvQJ-mBanXyhqw-cL-f4
Message-ID: <CAADnVQJKguqUD0bYh=tHnrGXOUOMrSk9_72HDFVcuMsv7=S_nQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/bpf: Make x86 preempt_count access
 compatible across v6.14+
To: Changwoo Min <changwoo@igalia.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-dev@igalia.com, 
	bpf <bpf@vger.kernel.org>, sched-ext@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 6:19=E2=80=AFPM Changwoo Min <changwoo@igalia.com> =
wrote:
>
> Recent x86 kernels export __preempt_count as a ksym, while some old kerne=
ls
> between v6.1 and v6.14 expose the preemption counter via
> pcpu_hot.preempt_count. The existing selftest helper unconditionally
> dereferenced __preempt_count, which breaks BPF program loading on such ol=
d
> kernels.
>
> Make the x86 preemption count lookup version-agnostic by:
> - Marking __preempt_count and pcpu_hot as weak ksyms.
> - Introducing a BTF-described pcpu_hot___local layout with
>   preserve_access_index.
> - Selecting the appropriate access path at runtime using ksym availabilit=
y
>   and bpf_ksym_exists() and bpf_core_field_exists().
>
> This allows a single BPF binary to run correctly across kernel versions
> (e.g., v6.18 vs. v6.13) without relying on compile-time version checks.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  .../testing/selftests/bpf/bpf_experimental.h  | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testi=
ng/selftests/bpf/bpf_experimental.h
> index a39576c8ba04..acabf869d2c4 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -614,7 +614,13 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgro=
up, const char *name__str,
>
>  extern bool CONFIG_PREEMPT_RT __kconfig __weak;
>  #ifdef bpf_target_x86
> -extern const int __preempt_count __ksym;
> +extern const int __preempt_count __ksym __weak;
> +
> +struct pcpu_hot___local {
> +       int preempt_count;
> +} __attribute__((preserve_access_index));
> +
> +extern struct pcpu_hot___local pcpu_hot __ksym __weak;
>  #endif
>
>  struct task_struct___preempt_rt {
> @@ -624,7 +630,18 @@ struct task_struct___preempt_rt {
>  static inline int get_preempt_count(void)
>  {
>  #if defined(bpf_target_x86)
> -       return *(int *) bpf_this_cpu_ptr(&__preempt_count);
> +       /* By default, read the per-CPU __preempt_count. */
> +       if (bpf_ksym_exists(&__preempt_count))
> +               return *(int *) bpf_this_cpu_ptr(&__preempt_count);
> +
> +       /* If __preempt_count does not exist, try to read preempt_count u=
nder

Please use proper kernel comment style in the future.
We don't use old networking style in bpf anymore.
I fixed it up while applying.

Also use [PATCH bpf-next] in the subject to help CI identify the tree.
