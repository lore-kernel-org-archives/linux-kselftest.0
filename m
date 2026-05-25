Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626D352F87
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 18:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732872; cv=none; b=ObEFq5p5Yi3kcex1p5hNXTVut7bGy7rg9PJqy+S1JS/2UjSARz3l0BDsnFyS8X9W4ycG+q3D1azt/b+JviKjkrZVqGwD37xBWyIBNyU1XD/IawmEYKkVXW0BFxuuohKMRGxDnqKrKQZVbxVgkyVS99uzesSnLvystEDO+klk8oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732872; c=relaxed/simple;
	bh=BpnA4XhIs5UtiDPdG52EaxYTy5pKl/uv/3Nd4jsFLsg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=m9U7/LbzVsly/O4kNtPOOznQQxcQvKNa/TemCWQmWmHZdeLfLc68ER5WB/CDqhntj9XM9gMt/Km7RpZzr/Twhe8YtalG+kgrgTK0Zq9BoF7Fp9YpgTXTZBQV6B54caRXeaLwrVkAjwrpuFl7ItxhuH78gv38C7uStjpSAplqnWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=Wucafnwi; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="Wucafnwi"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3044857f09aso4895845eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779732870; x=1780337670; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvdS4aX6gI9MEHBOaVRe7PnOJQUK7bdoDGLJ+oujsnM=;
        b=WucafnwiipiBAy5KX0BdL2AdnNPnISex7+VEW33G3dXeGfJA2DsHD1MVyTcYK6qqLw
         iavzrrch2ugkzgMzqDSrjIq8RskX43kbi7OUF/4grLXNtdDkiiU4Crjk7y2hWtESP6Og
         8+gGISm7s75Pq76puDwTa8vUBsBPuT26/OGdU4dvRqq98Z3DZqZdAuD9z1p+xtFRnWho
         KcjFK6gLsCa7uc1TFD15g52RgEeTsSIeHdTkoZSal5s4gppWAaoGWJqKu/9YcZbrHQEl
         rHC5S/+CF6HP2C5giuNVPCijYsMjIWPa/2EC2R4JEiq0sLt9hjdHl4N/s7biSKODDKGq
         FcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732870; x=1780337670;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvdS4aX6gI9MEHBOaVRe7PnOJQUK7bdoDGLJ+oujsnM=;
        b=AW7iOpVPKD/PlRviYK1M1Qvq69llETe5TCzVfyQQmauc15juCC5nF561BHuuruW+eL
         6uAtM05ogqm8XXCLUZQe+RkemQLiZRgUD7sYt20qA4ip9oe/Vi8Mf8N3RRg6xui9m5q6
         wEqI54JpqG1CfKsrWXtu5u5SRkcDWbJcSztVakI0hxd68DPDrKco7f6dh1+HgtP88jYu
         +FLtkAiJfDnSVZ/dfibI534HhznHsB//LQtIJ7IfxwHzv1WL20DqMDcOlPARS9qXaEnD
         qi7bMcdofLueGgP/5Y/URCyd7RQeVAJM58ljKWMFHcTWlxZ6pFJ4oWZoG9kKnwJ8yKyF
         EfRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ybkmJZs3t0ht/eD6YIb4Tm51O6yE345JqKXa5zxXtPIBAtuKPQH8/pFeFXdP6wdDqSpnwOO5GPf9iNk5+P9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eFQddHA1/DJd/4fo2QA5RXDWNj+MAC9qVuWKi8Elmm0y9CJi
	VpDnb7lrqaxR4ZqjuBhN4Zm6N+ykoFAEycbRT5dr5pg6No4XoC3701c1c+eGwyHk0Ys=
X-Gm-Gg: Acq92OFsDJQXiEqlx3lzIdEavF8dKd8fVko8dMtu9T89tpWej3phFlcnQu77Seq55lT
	9th9msaWPbL0I4mfF/3UlCMZ8XDeBMVk5VB3+i5RofogF/0/yqeeHMUJYcUluM/fzspq4NkMTo0
	r6iGWTU49gUbudAdGhLj/zwH+cghAXM9WxpPMsHkCr3CZRKZCK5aysWt07AyXkvWu7dmCXIS+if
	zXFCGn4DgfViW4B3xmwhxgXOs8kjyiLVXfIxQPl2itPV9ylUHX6OXP2SG4VMrgoGUKqvgZtDDNH
	wj+WD51WHZfUS4Z72B9hgxWETeYPlpKuIVVQs3RvcUr8jNMouoX+K2DvA+jP2WErcnsmX5BT0Ps
	IwCB9R/UVAf80WRhFIGAsJ8+IY/m2KTfnL9+M03YOcgNpw4SBxj69OYqa684hEldU/q/CGI+Hmt
	DxHJzCaVGvNN7cbA==
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id 5a478bee46e88-3048361afcdmr2512662eec.33.1779732869747;
        Mon, 25 May 2026 11:14:29 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::cc2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm8466985eec.4.2026.05.25.11.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 11:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 14:14:27 -0400
Message-Id: <DIRYNC29TMEZ.2YIXO06OYS53W@etsalapatis.com>
Subject: Re: [PATCH v2] bpf: replace pop/push emptiness check with
 bpf_list_empty()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <martin.lau@linux.dev>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260524025853.13786-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20260524025853.13786-1-suchitkarunakaran@gmail.com>

On Sat May 23, 2026 at 10:58 PM EDT, Suchit Karunakaran wrote:
> Simplify fq_flows_is_empty() by replacing the pop/push based emptiness
> check with a direct call to bpf_list_empty().
> This avoids unnecessary list mutation and simplifies the code while
> preserving correctness.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> Changes since v1:
> - Removed unused variable node

Saw v1 before v2:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c b/tools/tes=
ting/selftests/bpf/progs/bpf_qdisc_fq.c
> index 1a3233a275c7..8107f5934d2d 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> @@ -196,18 +196,13 @@ fq_flows_remove_front(struct bpf_list_head *head, s=
truct bpf_spin_lock *lock,
>  static bool
>  fq_flows_is_empty(struct bpf_list_head *head, struct bpf_spin_lock *lock=
)
>  {
> -	struct bpf_list_node *node;
> +	bool empty;
> =20
>  	bpf_spin_lock(lock);
> -	node =3D bpf_list_pop_front(head);
> -	if (node) {
> -		bpf_list_push_front(head, node);
> -		bpf_spin_unlock(lock);
> -		return false;
> -	}
> +	empty =3D bpf_list_empty(head);
>  	bpf_spin_unlock(lock);
> =20
> -	return true;
> +	return empty;
>  }
> =20
>  /* flow->age is used to denote the state of the flow (not-detached, deta=
ched, throttled)

