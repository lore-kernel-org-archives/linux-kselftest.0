Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EB3C3C14
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921307; cv=none; b=ADLb4lwWQMoKzXhuZvEnimcFB1QyZ7bvgj+AQMTLrTnFZT64pvrS+CkFLgYMXJkpYaBCZhwRT9QQRnsdiKIWIaHGSwscDdUV6LTRZAfTQuFNvkqSrt3fHKVXkbT5+MwdKynGgmVLm2Ydnv+xHpfW4A8DAfZuZ+qAc+M+gE+v+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921307; c=relaxed/simple;
	bh=qfdM3YubCe2IP79evjGQNlSp/HU4IyfWbW9l+cBm2Rg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=tu7coI0ZqVhCxf6L3QHsAnNU19Tsjj75RvYELQ8pvdiPBdvuqzErs4csE/V6RtJkG2AIQMBOKC1rS0lc9CzxwXxoIurLwPJP980NLi5okGL885Nu6EdF3cQNVhvNHzW5ZoUno7r//bFawWT+Z4l/DP5FQOghsdU5FOy7LOVYUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGepoum3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGepoum3"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1848633a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921306; x=1790526106; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy5ssaabRSlN5kBFNvs8mh80/gy44esWLyC1RJAbEbs=;
        b=qGepoum3EieqrlPF7DutwuW8Fc2VyWKRJkCu/M+PyxqYxN6PISB4Ba41CAQy6SUvIt
         ZBYqjtYi/jgBvXej7PPpe3izlR/z0V8yk3OlEb3Qj4CbY2wU63Neui7mte80/EVqefEA
         hEE6gDxLfcLdr0Ij4bzCVh8G7WoDDDaLJ63wpCbkUAyGdD1WU5E0wx2BS92ELIw+2/fj
         I091/bi1WcMT3RVFM26y0lq5orT0ExYCqW9pxZ24hk+bxVEB9OfEoOoRKtMtXTKB+O/j
         OLSyWbQvrCuyAT46+lXIfj4g7cD8HcqWTtuh8ofAeZjsfdvFs4R0k3c2Mam5uZ88/fO5
         +Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921306; x=1790526106;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy5ssaabRSlN5kBFNvs8mh80/gy44esWLyC1RJAbEbs=;
        b=rChNilBYcBE0LLweEcH2tQPLAF8Vr2PmFfVoOKcM6hX7HBQg0mgSi6bpDlZup93NJH
         5IoXlSyXzFnC3lw8lf+NV5p/9Q31A3QLUWUoYkaTklk5WKRFNvNWXtzTVXBjm6w+AzfN
         XS3NmTAa+Kl/f/mD9moNj7MPmGhcKQGiqk3/XF1/QpOAbfACbWFI3tSMagLx+mmY8Gxl
         Dfpi7tkRpG0U5d1+flhxHhoQQ0EBZjALCf8gMfpHsZPm7cNPf91p8s4xb1DVUvdGCTsY
         YxqLp/MWSw4kqQJ0vNLn6dISX3+3KRtjIOB+zBeehFwTCilOQccAqW2eIu4jPv7EMIjy
         yFfA==
X-Forwarded-Encrypted: i=1; AKwUvBxhCt8xIa2/obvf7DaNfJrlWt0NetHa2H88GRFHVVDyO4mGwRdhNnT+I9eosZvhVqEoNh7ab8WPA+t60HV1bR0=@vger.kernel.org
X-Gm-Message-State: AFuF++lu0NLIrGdChPU2yyKfNEAJI2lPuT0gI0oeH4cKzCz81NgwsTlT
	4JVCgX3C8/fwdteUiKvBqNU4C2J/QbGb6XrRA42VJskoGvmmdMdaBoOr
X-Gm-Gg: AYBFou3z00q4oWcMqpw0KOrTjb7moapRPWBZQ6Y0cOiI7p6DiBctm9DTYeiYuRcuWNI
	yAcOEPmGsxex4uH0eyKVjYl4jHfoYkyp4Fi86hoRZ4L+7JRkXbC1cA6LISGqyOvUpYy1fJ3NYa4
	KIwlljFiw1WOV6ily6bd4Zb0khHc1iEaz4N9p6P8yutbIGld5hm54InVCYXN1wpHuHTIbuB1t+3
	faXaEJt1fiJSwuo+43EgZPT+ZotgvLIvMG0qSVDdzqXel6juaGzfnQwQXJ8P9V7OJw2tGpVcXzi
	J055xIFKmMQ5aHH5EEre4d6uKKBsg1+1gxdwXLJPiV4Qh7dv2IU50MSkiHewX7D1neRdmU7F9+R
	/ZhFpwoZ3hc9IjR4AshkBvR02k/thSdSDF9xyFMlWeEMUvWXGA1uEz1jpC3xXxwS1fROkw7w3ht
	CdCz1cmC2lAvNdG5W1prmzmPD8W7TwUFrfhZ2sFaB8qP2ZkiKNtHFCGYvhTSX+eExoY/FldfRCb
	mqS/sPkH5S9Eb3Z26Gr0AmnVdRBaXm3+oyqqNaqavyFJ8CrFbVscRS1HOsPHB5lMafBviInlwdN
	T4/v
X-Received: by 2002:a17:90b:1647:b0:39e:4498:4863 with SMTP id 98e67ed59e1d1-39e54f4187emr17716173a91.10.1789921306000;
        Sun, 20 Sep 2026 09:21:46 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm1495785a91.1.2026.09.20.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 09:21:45 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 16:21:44 +0000
Message-Id: <DLKA5BT4JBZD.30HJC03MXC30U@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU
 creates a per-cpu hash element
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Donggeun Yoo" <donggeunyoo.kernel@gmail.com>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260920093153.439743-2-donggeunyoo.kernel@gmail.com>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com> <20260920093153.439743-2-donggeunyoo.kernel@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 06:31 PM Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:
> Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

Pls cc Leon on respin.

[...]

> @@ -1056,12 +1056,12 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
>  	 * known initial values for cpus other than current one
>  	 * (onallcpus=false always when coming from bpf prog).
>  	 */
> -	if (!onallcpus) {
> -		int current_cpu = raw_smp_processor_id();
> +	if (!onallcpus || (map_flags & BPF_F_CPU)) {
> +		int init_cpu = onallcpus ? map_flags >> 32 : raw_smp_processor_id();

The comment above covers only the bpf prog case now.
Pls update it, but one short sentence about BPF_F_CPU is enough.
What you proposed in reply to the bot is too verbose.

pw-bot: cr
