Received: from out-utut-a193.jellyfish.systems (out-utut-a193.jellyfish.systems [198.177.127.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0333CE80
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387078; cv=none; b=lhnsHmZUAwGRZKEeaxzmG2oDptCc8V0QrOncJCb2pggWRqktSZcQFu3McuuKs7TWEhZAuuIN3Dt9m33fFhv08aCFTY3TNvem6K0gZWlSmFU+4vKBWPIpdwedW0mpoN18ZgTcRvVAG9t1aZllEyKDMNl1LWdFtERe3xFHhgBkRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387078; c=relaxed/simple;
	bh=bp1aVVde9FhhrVusJR9Aa1f3RqgIDNsuyR3tVQs4qjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZfHpQ3G0AiaHc+Ykf7uBMTVlniBCcA/0kg3vG1jMrcWzEh6Pm9iX6POvvFRm87rF9MxR41FU1GAJGZqG65TV9Qnu6iZYAXIbqR4PRYKxJpIZLMTdD4tNgUKGZFmi3axsLphwtJRguG9Ok6IdJExaEXgSKX5d3n0z0yNHQZ3Gi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=bBBc1kxh; arc=none smtp.client-ip=198.177.127.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="bBBc1kxh"
Received: from 192.168.50.46 (unknown [114.92.81.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hs9NS2pz3z6tkR;
	Sat, 26 Sep 2026 01:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790387068;
	bh=bp1aVVde9FhhrVusJR9Aa1f3RqgIDNsuyR3tVQs4qjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBBc1kxh4bqRaFwdQasZ1T4DWoGYR2kzjtHP/8d2IDUoZlT/Tqldht/x4cgW2gTuP
	 H6vVx1EjNGpli3sh6qGMsz4TuU9d2Rp3YZksc73E0uzkU5ion71C6sgY8Sqf7tlbhV
	 6OYlDtEpa/aFb0VaV7ZJr9qHUjzQiQlvddXuptSYOXdy5Dd+p4JLfqC2QOy4Gz71DH
	 g+WaG962f1UoCCJ/GruHsg6pFS8dPX5+athg+MGe3YwyoWZOi0lnoQjLDZBTl2Y2cZ
	 nTgk/Q3WAUQ3EZS2qU5pObA5pPwYkqrVR0qLY/fP+80tThoqZBAV3+I+CXvhF27Aie
	 scKH8bTJtUTEQ==
From: Tianyi Chen <hi@tychen.cc>
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, qmo@kernel.org, andrii@kernel.org, eddyz87@gmail.com,
 ihor.solodrai@linux.dev, linux-kselftest@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, yonghong.song@linux.dev,
 mason@kernel.org
Subject: Re: [PATCH bpf-next v8 1/2] bpftool: Add recursive map dumping
Date: Sat, 26 Sep 2026 10:44:22 +0900
Message-ID: <179038706258.25394.17179048894458032528@tychen.cc>
In-Reply-To: <06229dde91361ba3f8d3c8d5ab0350f4a66643eb72b0c3554b1c146fe8523eac@mail.kernel.org>
References: <20260925174402.2028649-2-hi@tychen.cc> <06229dde91361ba3f8d3c8d5ab0350f4a66643eb72b0c3554b1c146fe8523eac@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Thanks for catching this.

> Should each iteration clear info here too?

Yes. I reproduced stale BTF formatting both across selected roots and
across pending inner maps. The regression cases mix an 8-byte BTF map
with a 4-byte non-BTF map and compare the combined JSON against separate
map dumps, as well as checking plain output.

v9 clears info and resets len before each query in the root-recording,
root-dumping and pending-inner-map loops. Both new cases fail with v8
and pass with v9; all 15 dump subtests pass in the x86-64 VM.

https://lore.kernel.org/r/20260926014208.24773-1-hi@tychen.cc

Thanks,
Tianyi
