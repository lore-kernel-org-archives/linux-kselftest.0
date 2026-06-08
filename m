Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDCD382F26
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942000; cv=none; b=jeRasnFrDWaeOLS372yN/JRq0HceW3ERzFuMosD3KzEULiwKvKXyD9V0iJ5aeDn+5zYtSiQMZRTIykd6Nom2+eGQTVkmOxzG4GFs8y09qqBlTfBfamWZfuUjs97Oavr0inrIwGXdXDGLYVTsNBJxpsGYcpvWUE+mNdKt/Uvp+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942000; c=relaxed/simple;
	bh=9j1zwOiqYR/j62a4SmkndR3I/fBKjx3NMWjiae/q3ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtgW8kRnhGfTMuBo0/2BfWbhbcUi/ws+UrV4NA9y3otHB0XP4irSRD2637MRzjiYBaqGh0Mb4NKReruYqHqUXBKUrz3vpdRTe/38QT13slFAsn6CF/RCNqb6N2dDh7M1IJ2wkp3+hgcyLHkItuGk9dS5pu4zVofHDglZvLA0+DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/CmtwqX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/CmtwqX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45efa80e0afso3581832f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780941998; x=1781546798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruO8SnBumLZRLs1kOpD88cW4Qstol4o2xlBdcC+hpIQ=;
        b=D/CmtwqXNyGX0yfK977KF9gElPvNCIInU2NrzbQmhyWE0xKKWUEcjUNzDODyE5jo4H
         sBnXO5I/0mY3/8ps/lM9mP4IK2FwzXYuwTOflph70TpmF3rnTN6gqDaNYNwD6gSU/A2i
         4Sj93K9kZ8snRreaiYJrDglKHandL+bfm1LmLR+8JXL+aAaHdBBqOzcRtKSyAuSLosNx
         aYPfG8IU6BbSM/T4+q37xRRpQjqlIpRzvMZHBH73AK/lA6wU26fM1UNDAxO6ysSSwxuk
         bZQ/xe4x3cNYqeM95kcG6dE+ZG0/FhSehLhpAG9lcHIYS1nzGJlGPeXUl9dFkvc3bHbO
         82Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941998; x=1781546798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruO8SnBumLZRLs1kOpD88cW4Qstol4o2xlBdcC+hpIQ=;
        b=E4NY63WWiv9519oU+/bjN2tWDwm6rNTx3rRgqWzsr5xDjIbcLhSD2fVHm0hE8EztnH
         TxiHItSCNlI8jUZo1uhwEoUC/etBRRTIYxPklx1x9UiYrSUTAUieaUMdAvgcj7ftCn1Y
         V37vGz8rXlpVnSOUC0eZXw2wC/ZNMizx05X2n2a3MubKCH7SX70mMcsxFYSGDlDIdKaD
         PolrO2AHUFKFX/nQSdKNOgZtu7Q5AcB16Uwls61OpyoY09DIFFvgz39b55TbAemblEMf
         m0QzaRYKPj6Lwh+1T/qKo0HCeUxqISua1dXSn1MUapxAQzDe1wJ3GpaGExY9g4NZGn42
         f36w==
X-Forwarded-Encrypted: i=1; AFNElJ8calo8RCxsKQsk7SkL/8c2CemCjDsK74s3aYLir13g4jiFocqCtR0WZ7gzrxGb82PcXLwgBwgaSF1OWcJsc14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/TsAtvJ7NRPNapTSZdsIsER6SH4fJZ5Tw1vruGt6OC5fBM/2j
	xb5eHu8GjSwevbdijHuA6jIhBVrhk9FN3zpJ0xjwIAfBmvSAAuBjlpQGZLtlXxFY+wv3g+Ey/m+
	jNsVYkWQ=
X-Gm-Gg: Acq92OFFUmDGmHLaZEXFP3Ipo/jEimk/2naP2/FcgpDueHFc/pyIuOGhSzE05baC3j4
	V9inH4SgdIu8/tN4b4lDQHVRPmDYmdgNosE1MM1fT7P+g0Cxph57yRfLmnsikkAPSjxRkQLI5/j
	gfF7jq7ty+5lEkgN9AndPgaY08xgwnuAk8lNiOC9bLvtbK2mkXOE4jE4GSTT/AEMH5Dj1iBEmEQ
	SAf9qklAvn8AFW7cvknYqF7tGXFORk866jnRE+Vkie9JDnQSF0EJVl7ntLX0dMZ6DnH9ww719Ik
	rakCo3c67UpdHgbWysxCoYcjKpddj7P0iPfFlQDM6hMnKyQXGdtS80k3PYmtA8Rc8/bkIoaG3cx
	UH2aKyLW/PvVKtTlfAzGjUSZEZF49B96Kp0HLVyx8tlJ/yuTWwbt9m3JZ7Zvg8t7ISyo5H8k/lS
	AyrNVBhq5i0N4aUK9PIwoSdhLE7JNuDeN5i1FOx4E=
X-Received: by 2002:a05:6000:468d:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-46030643609mr17198053f8f.23.1780941997560;
        Mon, 08 Jun 2026 11:06:37 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm54421372f8f.2.2026.06.08.11.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 11:06:36 -0700 (PDT)
Message-ID: <48f06bc5-0283-4720-a5e5-843af16cb9dd@linaro.org>
Date: Mon, 8 Jun 2026 19:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] perf: Use a union to clear branch entry bitfields
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260527121207.2312181-1-puranjay@kernel.org>
 <20260527121207.2312181-3-puranjay@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260527121207.2312181-3-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/05/2026 1:11 pm, Puranjay Mohan wrote:
> perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
> perf_branch_entry but has repeatedly fallen out of sync when new fields
> were added (new_type and priv were missed).
> 
> Wrap the bitfields in an anonymous struct inside a union with a u64
> bitfields member, and clear them all with a single assignment. This
> avoids having to update the clearing function every time a new bitfield
> is added.
> 
> Fixes: bfe4daf850f4 ("perf/core: Add perf_clear_branch_entry_bitfields() helper")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   include/linux/perf_event.h            |  9 +--------
>   include/uapi/linux/perf_event.h       | 25 +++++++++++++++----------
>   tools/include/uapi/linux/perf_event.h | 25 +++++++++++++++----------
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..f7360c43f902 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1474,14 +1474,7 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
>    */
>   static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
>   {
> -	br->mispred	= 0;
> -	br->predicted	= 0;
> -	br->in_tx	= 0;
> -	br->abort	= 0;
> -	br->cycles	= 0;
> -	br->type	= 0;
> -	br->spec	= PERF_BR_SPEC_NA;
> -	br->reserved	= 0;
> +	br->bitfields = 0;

The comment above here says:

  * The to and from fields are not cleared because they are
  * systematically modified by caller.

But this is an inline function and the to/from fields are always 
assigned right after calling it. Surely the compiler can work that out 
and this was a premature optimization.

If we rename it to perf_clear_branch_entry() and do:

   *br = (struct perf_branch_entry) {0};

Then we can delete a big comment, remove a potential source of bugs if 
even more members are added, not have to update the uapi headers and 
simplify it instead of working around the original issue.

>   }
>   
>   extern void perf_output_sample(struct perf_output_handle *handle,
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>   struct perf_branch_entry {
>   	__u64	from;
>   	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>   };
>   
>   /* Size of used info bits in struct perf_branch_entry */
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>   struct perf_branch_entry {
>   	__u64	from;
>   	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>   };
>   
>   /* Size of used info bits in struct perf_branch_entry */

