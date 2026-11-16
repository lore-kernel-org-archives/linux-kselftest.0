Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849310;
	b=0SFa1Z9fYCW0A1CTzkIhfeGqiqkkUDygq1Q7/Piv6psfRXGI5eGL/wf0GwcIukFSFaiu
	 3Exi1Q5+KDwux7HPFLztFoBaZmNMZFFEUfMSJfFT9i+759WsJZiO2Pyj1Blku24WlQ4Sh
	 nC+b4PH2pN5GWV/YebFSYOykANDidDpqWtS6OKgV+q0S+cNXDeIK9IDjWsarN1H3QEkhk
	 0A7dMAZY2pzwCRMAs1eGvYCYn++b91XlPZHS+JfmJ71vksxCk3hFIvhY5Aoz0FmF4wPT7
	 G8xUQu24prLAqcUwWLGywKG22bvm1WGo1502YrRVCHPMhQIj37VVdIKUN75ngW6x7Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
	b=T5OsUWiS0/pp89YdWQk/ZmBpP93w3JgZa/uQh2vmFe710fGquFQfJpwxCtjmO/BAyIX6
	 EZQStXFq96Fz8OFpf7edn98gbpYA+QVuVTZoO9EwUS+oSm+q1sq/xwWZrS/6omupfRm8r
	 k2kX8LIEla5B+ONhf1oOj/6hHkfcVeVMnJYUMbAS8YZ2Xbifo9cx2iZWYTet/Jy/xz+fa
	 /BdNx+3bv2sy2srCkvdw6eSevf/aHPqtXouU1IPMYHPr+X+GNVLYlzuE7KUgRDEzM8GAg
	 m7RS4e9P0BRyD6xoMfIXWpSrP3kcaa5cYZC1HfUBuOtPm1fi6qTNXjAWCLOtETLawvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPeAPlk+;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC28C606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 17:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC28C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPeAPlk+
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1516495a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849309; x=1795454109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
        b=BPeAPlk+jRpLnePRs+QNuzBU6xDP3ZVzV0UCcs30Ph5AFci32D8BA2iuxiB7PTkkxS
         4N9890b0AhomSOZJ5IBn6wcnTYCLz+j8rxQCXla6fkqTs631ZaoVoSoU79zbTpJdJDmn
         X+FolQ6YP/Nzq6mOSHqifCwj7Mo4O77TQHl0WfWFwkhhWnpdYvB2AgJZWXnNzE/pcZsV
         osFqpFU2UiQnFfCl5BDVpeBfjghoHEvw7NPiOoGTl9UK7IuwMdkaEP5Y8e0DyywHB2B2
         hLsimx2DmWUQR1ByeBo0VJkVnI1lpzbK1Uhb5C/T80btpQcvOeJE8UJqe3EhHDH+8/Po
         HLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849309; x=1795454109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
        b=CXvmKBiUu9D+qsUflfsj9aYfZRVsXPDsOHPUflsB0XlWMprvUHCof2aJwsppY1uMmB
         hrNeNH+NP6/mMRQGKW0PtW0b0jNfYrgCovDsvpjMrDPW5Qe6eo36YV5hqfMHy6WExeT1
         xkD01XMVQzfZ/Y6GOE/5oym29lNTdahls8NLS/MuGzgp7WElQ7GZVW5k4UOCR2I1sAEq
         F4bCTS+zxeFiZlo77FUZvS30V3zG1CzpgO63x2fSwFDOUP9b/z9XEzwJOlMdJ0JRM4Zi
         EVLfwdxxkMushVl+XwsuaZg3oTrZkZtnN0PRSGrW96cn2WNNx8snVZN8ignNyNk/8rWs
         Rk2Q==
X-Forwarded-Encrypted: i=1; AL+hErHwPPpAuIZUmaKdg5Mp16d++0P3J5phYjJ4dVbs1VL2OAd0dPY/G+y3Q2+zrXWZOZn3Ninf1Q4NunZaSkx/DMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c4PPwvnawP+Avn5+8OYQ9PQud057ZaEgKvG47HJaAia6iHUnN
	E4HkhaOzxZzH5JGtorFwCD8+BP3mgG6DETOJGD2FW36BKUPcw9q+fuZ2
X-Gm-Gg: AZFdTZe8ljX8mgHryqVRPQXZKiWzvbc4h8oxMBNxAh9RirY1DXFHaZ7M4PJCQBOi0BJ
	js5RXzpJp2iiP+xe9kBlkPgsGaC5v1lwy5LNzLREdDZBoKcoobiE/kRPx7TNkHpEqMait6OBXc8
	EeMFAWa2qgcxmsTQ3amSpp4w5NRszXNwfT4kFm7j3JSaGwzDay8Hk4fNlWybvbueuYzVNL8IHlJ
	g0sJ6jN7OVtXnKWPObCyC2k6mdCDeVKSdzxA9fuFJ/UdRc/pv2e0iY+/g+K4ODidyZTChhSBYBU
	C7cLjB2DQsl1+Iyn0gL19F4KhjWWM9MqvYWJXUMmvnMLn/YdNmkyNY8Dlmh7xeEcZLOAUwFziP1
	Yi3PXFM069GXndNQ9SBAM/utx9EGQiTNC5+H4j2J1E5Fkea7Rq1x+omDDzuOCFeXG/JkGL3Hp4Y
	IoNbD5n3FYCKwdHEebNYtWsE5NeHdPfH+MxlHzEwazuUDJFEvaszI+zyLE2FTJQ+G+I7lRR767A
	+kEhFjZ5g98SlVOdd7qthaGciV2q/faU2PDsShK47NQRwk1atgm7IIv+WzuxPGscJZdw3Rmnk+U
	Rp4wMFN/tVHdLPBvaX2Nv+Jzl+fEnJHFp8CKVUZJaC1pv4fzm/vk/3GrpAKLdltTN1WUd1M=
X-Received: by 2002:a17:90b:4e8f:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3a9826eecmr478799a91.61.1794849308712;
        Mon, 16 Nov 2026 09:15:08 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1887d7asm4464335a12.14.2026.11.16.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:15:08 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Skip memcg_proactive_reclaim when data lands in shmem
Date: Tue, 17 Nov 2026 01:14:30 +0800
Message-ID: <20261116171430.1008098-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <bbb07259-a2e8-40b5-9933-eb3d5d7a4bba@linux.dev>
References: <bbb07259-a2e8-40b5-9933-eb3d5d7a4bba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

Thanks for the review.

On 2026/11/16 11:04, Hui Zhu wrote:
> Would it make sense to turn the silent "return false" into an explicit
> assertion, e.g.:
>
>      if (!ASSERT_OK(read_cgroup_file(CG_PATH, "memory.stat", buf,
>                      sizeof(buf)), "read memory.stat"))
>          return false;

Agreed, a read or parse failure will fail the test in v2.

> Small nit: a one-line comment on the threshold might help future
> readers, something like "all-or-nothing: the data file is either fully
> shmem (stacked tmpfs) or not shmem at all (disk-backed), so half of
> FILE_SIZE is a safe midpoint". Also, printing the measured shmem value
> in the SKIP message could be handy when debugging odd environments.

Will do both.

v2 will also address two points sashiko raised: memory.stat is not
force-flushed, so right after the write it can still read 0 on machines
with many CPUs, and a shmem-backed /tmp should fall back to "." instead
of skipping. I plan to poll memory.stat until the write shows up and to
try each candidate directory in a cgroup of its own.

Thanks,
Kurt
