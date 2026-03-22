Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1754EACD
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 01:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774144282; cv=none; b=CoGrbNKZFfNbWQ4omJwA3D+sZfgpyQJXLC1gsQnE9HzhSMJPCzhDAmQ1/S6U5oQSfwZ+mi7HRhEhZSClCz1iVZ22UoaVy0A+6wu9cap1iznFH74DaKpwg3wutZtyI4RdjkN7Akyv+V0uY9PVn//SqbRUCbq/fZUxQK4WHFyiVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774144282; c=relaxed/simple;
	bh=3wV6qzVpAsYqJwaSyznGfPODWqEYhsWXQFQvbz/io+Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=U0apmBQ4t27BgFMP3RyUj8pkeoQXUfo7gNlgPdks32hC7E2xwsjGejUoR0AdbLcJfdMmHm9N0iWqaUb0rht+7ffC2Bpa0b45dL8Dw/+fz2Nq5wgxr2GS1rp/wO8O+T7egb2r7UyOSBgypRECOIBVMP0hqsbNaKd3iXV4RmVcYE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=yxfpjZlN; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="yxfpjZlN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50917e02472so21499081cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 18:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1774144280; x=1774749080; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PspDfyNJnO+7FZv30/IIcadDyXG1kBEYdchAYPVdXh4=;
        b=yxfpjZlNT2/o1/+xxVx9eP8H9SBIS8E+R50spOGBtVgAOGniiafvSg6V0932RF8FGG
         soA6pEHS58GRoEq1zPqZbyObVxzFtJ+7Pp3itqtaYsrGNGT48RaNAB3BEeKh1DzUI6xy
         /eIMdPxAPE1+8WfIK7KO0F4OXkU/diNAAVzen29pjoYq8ihxUVD8FLgga/vJdsdpErdZ
         Lxdl8w8nEKX50y/418DfSOFSeYwh2AtEXxRBNkaptOPpml9RyC+qQ5ZcBrCkTXoNu5GQ
         kE/EVQNrY8OdTRsrzfpmacStVKmL6bmc3qsNr+E3FPExIPusjto9jfrl6BlVkeMESlix
         GIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774144280; x=1774749080;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PspDfyNJnO+7FZv30/IIcadDyXG1kBEYdchAYPVdXh4=;
        b=BBjokSMaJYp3N32u4cJO7G4fdhOz/i2SZKDoikrPDKMMt8HrZIS0ww6xtWEXv13tdd
         zfd60HM1rdHJx/mEsAazAFTWYnsKuk2i1hRbmVQcuaE5zEIn2JaHh7Y5cB+a0dq2jxUa
         b14DSoSxpJpCTI37XQiL+h/YdxnZwGl0J5eI6car8rBrMSmneenquUCIVRqwwSLZa2y8
         Osp7r8WqF0yoja0aEbIGUI0swPjKk33snJji01Ab/uJPaL4abmc5Ja1pYO9LkJuOQmHJ
         bdQLUar4DQt0VyGZJf2l+hwSAqxGgwxmHPh4nJCetdSxue4UGrRCiOF4IdPy+lfHPl+d
         4RWA==
X-Forwarded-Encrypted: i=1; AJvYcCXiCYEv0iuTZ+EfVelyI2uaDAfpXsJBMd64weOhChexzJBaeBvOsKyN8jINrVXVb7bZqDwZFw/gKZD+eFEgZeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLKmA1L8T7cYyBbBFkV2wUHSsn/enm93iT9YdF0+vWitAH+4p
	BrF0wgDeW30uAedFd22AAvqWo2ECQvNwdjsWM7cRus+bX4O67fETRfzDz0E38sKzyoIancXehyt
	0efrnN6s=
X-Gm-Gg: ATEYQzy4L5RU881+RIcH2qXdMy8uAhqZvD7nyiCJ733FCo7Ie6a+6UMZ7VnlqnYc9v4
	auwSoYw80QnATCUnOhjeUVQK3DIZDeO713fsSuDKkeUBsQvcQUueIzCIdZ9m+rrVTohysrmTAhM
	8OXY6aRN4kgbCPOWEiy4KHlBnta62CFYUR4sjmnhr/cefwzrFtCG/G02zXW8wNThHZGSusgFTar
	1Se73B3q7rrwsslq569eTy6EqD7HHFgA9A3OUNe81//3Uk1oR40UUq53At3lL/0rn3tXsJoB1MK
	7e1RGKnaVD6/8WJARmWOf1gBuk2Pj+4kdkwJ2kMQte4E0ZBshGhVLp817dmv3rkWGe3xUEQhQwJ
	vyznd5VWCNggvv3BZHvjNXWyAkOe596y4VGIy3qEuXOCEom2Mze7KiwpLRlQsZ9ixcxA9FOsa7h
	ek57bm2UgCAoAfbigaVuFWNNM=
X-Received: by 2002:ac8:5d4e:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-50b37512ed6mr129658601cf.48.1774144279741;
        Sat, 21 Mar 2026 18:51:19 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb3c91sm54518171cf.4.2026.03.21.18.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 18:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 21:51:17 -0400
Message-Id: <DH8XNPJ8LC2K.5SQUBA8FZ9YW@etsalapatis.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: test access to ringbuf position
 with map pointer
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Menglong Dong" <menglong8.dong@gmail.com>, <ast@kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
 <haoluo@google.com>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260320084155.288417-1-dongml2@chinatelecom.cn>
In-Reply-To: <20260320084155.288417-1-dongml2@chinatelecom.cn>

On Fri Mar 20, 2026 at 4:41 AM EDT, Menglong Dong wrote:
> Add the testing to access the bpf_ringbuf with the map pointer.
> "consumer_pos" and "producer_pos" is accessed in this testing. We reserve
> 128 bytes in the ringbuf to test the producer_pos, which should be
> "128 + 8", and the "8" is BPF_RINGBUF_HDR_SZ.
>
> It will be helpful if we want to evaluate the usage of the ringbuf in bpf
> prog with the consumer and producer position.
>
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>

Once Jiri's feedback is addressed feel free to add:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

One nit below.

> ---
>  .../testing/selftests/bpf/progs/map_ptr_kern.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/map_ptr_kern.c b/tools/tes=
ting/selftests/bpf/progs/map_ptr_kern.c
> index efaf622c28dd..c3fa57ec430b 100644
> --- a/tools/testing/selftests/bpf/progs/map_ptr_kern.c
> +++ b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
> @@ -647,21 +647,39 @@ static inline int check_devmap_hash(void)
>  	return 1;
>  }
> =20
> +struct bpf_ringbuf {
> +	unsigned long consumer_pos;
> +	unsigned long producer_pos;
> +} __attribute__((preserve_access_index));
> +
>  struct bpf_ringbuf_map {
>  	struct bpf_map map;
> +	struct bpf_ringbuf *rb;
>  } __attribute__((preserve_access_index));
> =20
>  struct {
>  	__uint(type, BPF_MAP_TYPE_RINGBUF);
> +	__uint(max_entries, 1 << 10);
>  } m_ringbuf SEC(".maps");
> =20
>  static inline int check_ringbuf(void)
>  {
>  	struct bpf_ringbuf_map *ringbuf =3D (struct bpf_ringbuf_map *)&m_ringbu=
f;
>  	struct bpf_map *map =3D (struct bpf_map *)&m_ringbuf;
> +	struct bpf_ringbuf *rb;
> +	void *ptr;
> =20
>  	VERIFY(check(&ringbuf->map, map, 0, 0, page_size));
> =20
> +	ptr =3D bpf_ringbuf_reserve(&m_ringbuf, 128, 0);
> +	VERIFY(ptr);
> +
> +	bpf_ringbuf_discard(ptr, 0);
> +	rb =3D ringbuf->rb;
> +	VERIFY(rb);
> +	VERIFY(rb->consumer_pos =3D=3D 0);

Nit: Can you repeat here the explanation from the cover letter=20
as to why this is 128 + 8?

> +	VERIFY(rb->producer_pos =3D=3D 128 + 8);
> +
>  	return 1;
>  }

> =20
