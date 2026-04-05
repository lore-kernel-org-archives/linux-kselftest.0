Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA78342146
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433271; cv=none; b=Z99ftUGboap9lGkWviIrZKdpeQFjHqyVik3RY2Qd3eZqSmoxx5+9dxrz5BgpKY8DPpl4RUHvzDspTnd33cyFfUUt5bNpFLl2Jx5ewfOye305fn086WIdqdRya4vB1guXr4u8UD46jZm1jM6xnatnP8OcC9IVU9AYUXoVeqEc8Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433271; c=relaxed/simple;
	bh=nnE0n3Olzcs3ikXxyvwZtpvMfL9A+g+9v/5VhawH40A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W6XR8iycbQLB66JkWb+du00Z2dNPDt1FiomFeRHxtwPsnqHCFYAhTNbe9MA+HnbkFOANsmJ2UmO4fMZos+vypNbUpEaV6T9+Mc1kyvqT+/5I8u9YpJbKJlcmnDVAm3P2LqkWaSgbB70BRlE55KSupkPcEkntf9ifs3uZqtXevHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=U9LzxMCU; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="U9LzxMCU"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c76c067bc51so1118978a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 16:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775433269; x=1776038069; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw6TUPdhywhOpcOC9GSGOxp4/imbBV1U3y0bPk5X3cQ=;
        b=U9LzxMCUK5K16ZcZB7U0D/DbvcJEUt1UxaY93bJCFmc3iRVYJ+FerNMjAxWiw7DRSU
         ixfH2HkFIPPFgqcwUVoIeVO6TaJBq/kBmiV6EyZ5HitJ5aGRX9E9JZ1HaqBxgvT/ivU9
         S2gcXAB2C5zoHL0JB34zljHilBxfR7jLGBuK9Ujb6av7289FABXjAK/A3CW0p2WLHrP5
         9xvwsQaYOs59XYlcWAxuHEu4h85CdpblfYVRAk+6LDiZBzmpI0FrWEdG1IVOGVAYL2l2
         gOeeTUt1nsIkp4sJPOfjVMyjqGlbV/I0cj55M3muht3lhR+/8OnF792NfoiFFPW00Bqw
         Yh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775433269; x=1776038069;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qw6TUPdhywhOpcOC9GSGOxp4/imbBV1U3y0bPk5X3cQ=;
        b=EYIbysNcmobjIPSh9YbRXKKnIZd2Nvu8tHpbqyrgKUeg3dZj8ymyoQTb6Hbf7cwi3P
         nr6WLdnAkDeiH83C50Npe/DxojXVp/qRYScSOvAmjG6ne+M8wn6gL59ZKwks2aX2rl7D
         qw+2DV/wE0NQS+AyOs/F4Q7VeH2estKNBYA/fLboE2DXtiPePQzZ77CCFadTxiyDYYSp
         I+VxrJYUMy0NUYSJrmL+rxs4PPf7RSDLjywdH1t2P2EtudZfLHS+dq4uLIZuHaY2E2+5
         YGgcIosIdZTMvbn25XznCBMUf2zm4tQnXT6AOsjIu+ZGedu7j4n16fDiMhNgIyc/H0fB
         7bEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1XboacHF/0HZkqzQCyJxbTpJ0YPlL32XMhBdc9X6l9hFFqh9KTfBlf2F1C68DVltc7zJWRn9ZYpOvWobrvp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vkxszr7pgFCDk+VQ19z3atg5bDeOMQMJcgd3RVS0vFGq/tjO
	JRcOsOG/da/1wfb1vHguBQznjkZLSlkMfJpaZRJ+PLNWL9m8cxQru8G+32uFhfo57n0=
X-Gm-Gg: AeBDies8cOkt8hu75Qddt15KNda5ZCHcm583QgefGPaW/0qs4XMUAWhy74ska6+lv8N
	su6819fTBSKSOl4952fUPJMbTpIx9u9nLTKDJLKv0tXmgbfUotGCVALM7cpzs9lnDgsG8k/4OYZ
	TVrnKju67zU9RHF9C30te/JnvuRl9c+UiwQjdDKDxQtSJEDrVIchVBEYEbsX5ex4rZW3/Bjp9jf
	aE2BpHAeaestoHBZjoSuGlm5awbtzNz3qQd1udCSDfm7zEDWIK2vCN4Pl1zm9pyOXLLNJbooI4S
	eCQ0bAeKBh7U2cntW9igInATEkrlsfKCNM7anQ0KQt1jZFu8kMVASc3UAboa2GGe4l9y/9J6AQg
	CyZ2IuvHTEnZZ8G4wL60E29PjP+VLkFVowZqzG0swvl6kQsVPAWOmX5O1gr+0gGD+5k2648DRWA
	wm0mqQ8pY=
X-Received: by 2002:a05:6a20:7f8d:b0:39b:f026:6f79 with SMTP id adf61e73a8af0-39f2f0f86e1mr9364005637.21.1775433268959;
        Sun, 05 Apr 2026 16:54:28 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6561fe9sm10324516a12.15.2026.04.05.16.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 16:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 19:54:27 -0400
Message-Id: <DHLMKFBINRKW.BS0BEK9AMU86@etsalapatis.com>
Cc: "Quan Sun" <2022090917019@std.uestc.edu.cn>, "Yinhao Hu"
 <dddddd@hust.edu.cn>, "Kaiyan Mei" <M202472210@hust.edu.cn>, "Dongliang Mu"
 <dzm91@hust.edu.cn>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v1 1/2] bpf: Fix SOCK_OPS_GET_SK same-register OOB
 read in sock_ops
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404141010.247536-1-jiayuan.chen@linux.dev>
 <DHLMGWNKBI4K.3LM87NOU4XB3O@etsalapatis.com>
In-Reply-To: <DHLMGWNKBI4K.3LM87NOU4XB3O@etsalapatis.com>

On Sun Apr 5, 2026 at 7:49 PM EDT, Emil Tsalapatis wrote:
> On Sat Apr 4, 2026 at 10:09 AM EDT, Jiayuan Chen wrote:
>> When a BPF sock_ops program reads ctx->sk with dst_reg =3D=3D src_reg
>> (e.g., r1 =3D *(u64 *)(r1 + offsetof(sk))), the SOCK_OPS_GET_SK() macro
>> fails to zero the destination register in the is_fullsock =3D=3D 0 path.
>>
>> The macro saves/restores a temporary register and checks is_fullsock.
>> When is_fullsock =3D=3D 0 (e.g., TCP_NEW_SYN_RECV state with a request_s=
ock),
>> it should set dst_reg =3D 0 (NULL) so the verifier's PTR_TO_SOCKET_OR_NU=
LL
>> type is correct at runtime. Instead, dst_reg retains the original ctx
>> pointer, which passes subsequent NULL checks and can be used as a bogus
>> socket pointer, leading to stack-out-of-bounds access in helpers like
>> bpf_skc_to_tcp6_sock().
>>
>> Fix by:
>>  - Changing JMP_A(1) to JMP_A(2) in the fullsock path to skip the
>>    added instruction.
>>  - Adding BPF_MOV64_IMM(si->dst_reg, 0) after the temp register
>>    restore in the !fullsock path, placed after the restore because
>>    dst_reg =3D=3D src_reg means we need src_reg intact to read ctx->temp=
.
>>
>> Fixes: 84f44df664e9 ("bpf: sock_ops sk access may stomp registers when d=
st_reg =3D src_reg")
>> Reported-by: Quan Sun <2022090917019@std.uestc.edu.cn>
>> Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
>> Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
>> Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
>> Closes: https://lore.kernel.org/bpf/6fe1243e-149b-4d3b-99c7-fcc9e2f75787=
@std.uestc.edu.cn/T/#u
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> This patch only seems to fix the problem when dst_reg =3D=3D src_reg.
> Why is this not an issue when is_fullsock =3D=3D 0, but dst_reg !=3D src_=
reg?
> In that case the dst_reg is unmodified by the whole macro but is still
> marked as PTR_TO_SOCKET_OR_NULL. Isn't that a problem? Can you add
> a test case for is_fullsock =3D=3D 0 but dst_reg !=3D src_reg in patch 2?

Sorry for the double post, but also check sashiko.dev:
SOSK_OPTS_GET_FIELD seems to have the same issue as the
SOCK_OPTS_GET_SK. Can you add the same fix to it?

>
>> ---
>> Apologies for the Easter timing!
>> ---
>>  net/core/filter.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 78b548158fb05..8fee00e6adef4 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -10618,10 +10618,11 @@ static u32 sock_ops_convert_ctx_access(enum bp=
f_access_type type,
>>  				      si->dst_reg, si->src_reg,		      \
>>  				      offsetof(struct bpf_sock_ops_kern, sk));\
>>  		if (si->dst_reg =3D=3D si->src_reg)	{			      \
>> -			*insn++ =3D BPF_JMP_A(1);				      \
>> +			*insn++ =3D BPF_JMP_A(2);				      \
>>  			*insn++ =3D BPF_LDX_MEM(BPF_DW, reg, si->src_reg,	      \
>>  				      offsetof(struct bpf_sock_ops_kern,      \
>>  				      temp));				      \
>> +			*insn++ =3D BPF_MOV64_IMM(si->dst_reg, 0);	      \
>>  		}							      \
>>  	} while (0)
>> =20

