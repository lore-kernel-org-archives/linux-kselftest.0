Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7C34AB19
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571578; cv=none; b=hTSVkS0yL1wxC8c0HsV74bNcnxk44XS5shvqdvuv/ceEZdEt4a0O6EQJaIl9Xe8LdoSKBoX8DvSA1s7Lc4bu3PFfyUsArOu/iiVnpNczOoS5cEy6I472XJ0ENGL8bN7KDK2Vsq3JOGTh1Di5EQpLacLnLELo9X2g+q8dTJz1eY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571578; c=relaxed/simple;
	bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LBkx1+rIczkz3VfDJMLPGKsmJ6XhVv3AwaMXMxugrA9YdhNzlceh++qN8eQ04jA1sMxFXYZFCXDzS9WyBvP3sY5n0VRlsPZHIJILOwOhoI+lP+bsUgVJuteODL8T6s8xLfQa93adII7mv8sU9NvcipbR/2XAR4CH32olgkWBUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3qa5dIG; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3qa5dIG"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-482dd2e92ebso1279097f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571574; x=1790176374; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
        b=f3qa5dIGbc8xMB3VXAzEUz3vGgsHzYmavGab7N0JDWcSFTiel2BuBhFinS4lwqwNXO
         IbR/MpM/hRtAnexWlUfuXd//TVi4ZdXuVJxz1vxqq0g3GBWPikTc3qoK3fqO+8GkuSDf
         jDIBZH07zVvdtYcRi4ECzAlJz97/mNnLbspg2kqSSl+dGwUH/sDvaKZqjMxiu1bPpdyT
         v9RmH76ZorERdlx0TU0icekJt/67mw7QsnuV0pmv1ejA0e/niHHCEurG/t+TDDp7MGd0
         EKXEEXcMXghVZsWUBI28g6nORtZ+y6S3LfHCKzr4OcZet3Wtl8UgljEFXW1Tr+Zjs0Ul
         FW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571574; x=1790176374;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
        b=KPXgFWjSWsypMegFb63B9iAlN6Bbkii8t/gSZdwhbF1SuiesnronsgfIeiizKYNs9S
         z4FpT6Sfa1kzABYxGbOU7nrTeSh9bnw+YvQ6LHoi+aHtZb97N02VmEXGjGm1U7kYiycK
         PCGQ4UOnM4prLS+GM4kJXd5kHALO9ie9ZnJ5yReoB9+nnbbSPGIb0Q8x4B0TK7YQtYGE
         oZIi0vAnqfTmkg1mqztOlpp88UuExJY42w9cYnifwrihYjN04/nPWFjpjEtNZbKJwIYw
         3aKYrhwr4+K9S3qCEHvMlBqgef7J5kDJdTpJluNwZTdvLWqrNImgxLTaPlppVWyvAkDw
         Vqow==
X-Forwarded-Encrypted: i=1; AKwUvByRigJoKl+l4EhlijMLQuPbL0WRoVvVeRAFbT0r62b0pQ3npr0VEMPPiUw6RnNvAeCbMGUAnDZXb6GvelIT4sI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTyNvJi2SaWDeg1SxZRjgxqWzMX1YKjtaqE19yhtRHv8VcrFtc
	lJn6XT48MhEVF0VeafEnB5M0oGBfbekG3muhabmrwVZux4l0HF1eH/xV
X-Gm-Gg: AYBFou2LkhVfXuuwbI5UglicFXEOeC+AVGFp+e7nHoKgx8Dqml0jsb4Bjt9Gf4QQVuJ
	lIcmyXYnc7XEiw+cFWl5g/YuhSdUtL6P7rlI2+YZgg65fUK082frmtChgco978IlQOqsD+HJg3A
	ssAwrMRuhBVjxfn5lfhWPcE53PHyepHKYQOLDvrmwnZRBq3UsctoHumj05Sf4t67hl3yJcP2grO
	vjjL1an9zMcbeOPNXf6a4TYzotvYNt3teqRFJY4ntpaXgxqFez/cjHwVePqdstqbBFWyGK0o3fJ
	mrM+lyIEk/r4bRWi8Ork2VOm/+VZnyIG2n67tWvQlvVeiYZc0m/qnWk5BSktLIIX2MmOCuq+Ypq
	dz+QoQenBWjex07N4IU+7rYszg3kiPus1wegmNP5iTLbEucsBydLxd+a0NH7+WknTomAaTXZZhp
	cjLKZzSyeqRW/0LGCDgS6p7+kkCVoAhskhVQzbGwL1uSD96cuzOuzKM8A2w/Pex88vE5SxPsjIe
	olsek8y0xxMH+T6yn2EN+mnOseUkmzYpmx7CZQqpkxRhcULYW9xtIUqBFhWlWfwo2X5a7dSA1FA
	TjVlgE7fwEgP93pUGVGhbaS7y/zre1z0N6rexg==
X-Received: by 2002:a05:6000:468b:b0:487:afe:c154 with SMTP id ffacd0b85a97d-4870d03e721mr2779653f8f.40.1789571573885;
        Wed, 16 Sep 2026 08:12:53 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a41sm7320342f8f.18.2026.09.16.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 17:12:52 +0200
Message-Id: <DLGU6EUUD8HP.3SFNWRU1728IJ@gmail.com>
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Barry Song" <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, "Hui Zhu"
 <zhuhui@kylinos.cn>, "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH bpf-next v11 1/2] mm/bpf: Add bpf_proactive_reclaim
 kfunc
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Shakeel Butt" <shakeel.butt@linux.dev>, "Hui Zhu" <hui.zhu@linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1789475073.git.zhuhui@kylinos.cn>
 <ee6bcf945910babab2200f05040975492aed21b3.1789475073.git.zhuhui@kylinos.cn>
 <aql_rkQMtlLmMstC@linux.dev>
In-Reply-To: <aql_rkQMtlLmMstC@linux.dev>

On Tue Sep 15, 2026 at 7:26 PM CEST, Shakeel Butt wrote:
> On Tue, Sep 15, 2026 at 08:29:35PM +0800, Hui Zhu wrote:
>> From: Hui Zhu <zhuhui@kylinos.cn>
>>
>> BPF programs can observe memory pressure on a cgroup, e.g. refault
>> stats via bpf_mem_cgroup_page_state(), but cannot act on it:
>> triggering reclaim requires writing to memory.reclaim, which BPF
>> cannot do.
>>
>> Add bpf_proactive_reclaim(), a sleepable kfunc performing one
>> proactive reclaim pass on a memcg, like a write to memory.reclaim
>> but without retrying until the target is reached, so that when and
>> how hard to reclaim is BPF policy rather than hard-coded thresholds.
>> The reclaim target of a single call is capped at MEMCG_CHARGE_BATCH,
>> as high_work_func() does for memory.high; reclaiming more is left to
>> the program, which can call the kfunc once per bpf_wq callback and
>> stop at any point. It is limited to BPF_PROG_TYPE_SYSCALL, because
>> other sleepable programs may run with filesystem locks held, on
>> which the reclaim path could deadlock via filesystem shrinkers.
>>
>> Convert MIN_SWAPPINESS, MAX_SWAPPINESS and SWAPPINESS_ANON_ONLY from
>> macros to an enum so that they are emitted into BTF and usable from
>> BPF programs via vmlinux.h.
>>
>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>

Hi Andrew and David,

This looks good to me (from BPF side) and Shakeel, Hui might respin once mo=
re to
address some of the selftest concerns.

After that, any objections to taking this through bpf-next?

Thanks
