Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641446;
	b=dRdPN1H/GeqO4ZyyLFjtYqNb5D/bXd+0c8rq7PUk4Xt6VEqrMqYYv+hdrRswoXnjFFAk
	 wLv0XR0H4snxmqQMDKZ+VjRjxKy5b94l4G3iwIs7Cp3axohZcdhmk049c2TFPk1jEH1OR
	 NBkQCj4mZ/kG8VYF8hnQAtmnqBKy0Hh3+1L1ENhJG8+1iqVR5OWWCwi86Z1g2+NbVibhR
	 NDTb5mu+QmSQvVRX1SMiYhkoj9shJyWD5vHpxCEavdlqmNnx85KZolzIzfx5GMAlo+nts
	 LP0NcHNGUcFTb+HdjCDLPaQWjmiOzWlJwUXu0dzTEMteCR4qhMhZMh83U9/vF3k38SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
	b=UtNmodyWxSOtsGP/sTpA5uxLrQf/kBMWCpnD38++xlnnotXi0Bth2M8NdT3axunxQhgg
	 78cg+O006ZANZ2GYFDw1KMosSQNnsw1Wl2Hiq1ECglEsYc4P0DUditHbmJQkwKNGBspKj
	 /GwRyCeSDGMUDEPKoWrysFvgZNr9A6zZm0lOFXxicKsQvhx5GQtjk5BBLMzJlf9HSaHJ0
	 V/Iq5A5OThCtueelK8Prjy5e0xyZfeo20vDXHtoCCQUexcNebHkblsDxGX7eIokyM7QlI
	 7etEGGN9i4UOya898QP9ZkLSAjTR6+sqp9RLgbZiJaznFcb0p9Z12QUA3lndXAAavqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbANDaoZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735E606B1C5
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A735E606B1C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbANDaoZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so28127005e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641444; x=1794246244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
        b=LbANDaoZCQKZPwMi7B3S9QQ1jyxcinSKIlOFzSbHLK+XvBF27u/mJb1LiJK+ETn6Op
         FLYumYA0lJOclOTIo4ZStDYTGaQOUR+HHP3QH4UiVhBg7bv/Dy9U3sE8dUFvYYBFjse+
         9LPanSrKnvESryGi1rFCLuC33/0eb9WRbWljeNmO2veWOoE4wauBm3Z7deMmGvrHyLLg
         stzbGPMQUwqDWd+A3hNNbTsyGFVoaZqQv4oLHJPhtQLYfQpzHYy4tj2Kv3bgR7j2k91Z
         bWiURnTQ/CvWe/3cISwM7btd6E0CxsTKsGHCccfFsJFuWNQ7r7Nb5A8iSm65b8j7d5TL
         mbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641444; x=1794246244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
        b=HGU6iGsmqhuJYb7SRDxKA8/C8OFBI6Xf5OEVNvdkaABUh8xbjPLiaKu/opwM8+BbTm
         20ZN4ZdUKeFYVk1J3W4zxtKTsTkV1le5jY1C4ybWI4ouZM0WJi2+sejvjyjKo6uzRmfe
         bRXo2O/43op0CnkSzy9/3J/kROWlrSP5NaKr12WsWRUm47/ImNztauTH6CDwmjK1e3Uz
         8+zYvUa6Kn4v7fRd3TYMGEXpIO20JXaN+MQNu7BuD4EP4/mDS89cnPxdoc7kUCGb6/3I
         4+rnwRaNFRho1b8WTbd+rvDDBwCDETIsjryGqFr7Bd5YZi0FOaLolpz9uhlXwFNLeQRt
         dTOw==
X-Forwarded-Encrypted: i=1; AKwUvByPlPXzkXUaJEtbH6vAUpIWIt3W0y5HBVc0SfMRQf6PxccaDAD73fWtNaenHHwc8v20tFZLgf+HdNouYyI53kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG162Oq4JSiiZLMukj2dncpoXV3eO1ZexEX1/NGFmlbVTr8ZUs
	i/YA80GTSmd/2JDGoSzgq7Gt09XbKmX+xMeNEfOvi1LmdCWKTvUyFcPS
X-Gm-Gg: AYBFou3Fea4IukXPLLoRAOke6S/w519Gz7iKKYto7gcItLhZNE9f2z+dhugJWSXyrFl
	dqHAFOoKZXoVpXcgPYhCg3iULjIaXAmMaP2aEQzcgsJ2UhHuXK0S/MdukFU8ARt7xAV02qbu7CC
	yg662QvU45Uq66qZiv7CkzVJ3DnlRRSqwbPSN69GHTmryQPfy8gqUaUBB45jwAxFTk2peok7oA7
	xCXWeZ1VvC9qYXMt8WRbIhjNIHuLM5kSxRUI0CliHX0kDDa7lpQ8n7hXkGGnxeZyejP5R9UQh5L
	xoXCp/nItT3e5CpbBLVESNAFJgttFqn8uJf3N0jTrRyz6tx4dE1MIIGcdsVu7+ph+n4hslrb0GE
	aLjhp/PAxHvBpKVP0HttdXcB4zu1Khdfif11++zwL9c2QsIG+GKN9i92ZJnqqhM8mqGRdZAqjMi
	4DdDsKFNnJU28N2KAA2T15POi+Oh7IWhbC6j8r6TL8M+QiR6dyDzx11sxSsuOiyXOjpZMD7ouFm
	lxbp/pLhhTqcHhACBKMxhp0qEXHettgP+LO0RQ2Z9wyVEuaQKQBSQZFUCZTOnbJxOakvrSWvrOq
	6HkYdAIzJ0yn7sEHqqgD2jTiMa8aHjC0yuiZfHMcba6T5QCqMe7UEKKLiLzELLPV5L8si6FfP/G
	Y
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr238059655e9.18.1793641443872;
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 17:43:46 +0000
Message-ID: <20261102174350.472592-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102174350.472592-1-mahe.tardy@gmail.com>
References: <20261102174350.472592-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 8fcb8cf39cc0..cd8ff7f42768 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -10077,7 +10077,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -10092,12 +10092,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
-			if (obj->programs[i].autoload && !prog_is_subprog(obj, &obj->programs[i]) &&
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
+			if (obj->programs[i].autoload &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

