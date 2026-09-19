Received: from out-utut-a192.jellyfish.systems (out-utut-a192.jellyfish.systems [198.177.127.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58D2C3255
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818837; cv=none; b=rGHKGGBV9AexD1f3OJrGAG1NkqbNj37Hr8b/DwNCMDDML74GK26N3rrpIlzDbREZ5Nlg+zVFUTtlIL61Tje2YWdx+7HtTDYPrrzbcB2ReF2XUhTCfeDCJoSRE4R4x+o1xXU28CzI66cSc2LzlWAHoKa3NDnHo08i+xRR1x6y52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818837; c=relaxed/simple;
	bh=Jdbtc7DFhLtiUWh+PEh7yNbUvxZT1UPsUi0m/9Hg6oY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID; b=nm+mbkyacI+6dFECSdSJwMZKtrxpx3acCk9NudSqQ9WGkBMwlmsLQlNBcMqaziW9/x0tTBMhf0mIcBuxw4oNBnGkgsAx2UYyyySP+nY4kXx1ZR4gwRdnJiVXTnEe9fASydsm8E6+QOAiqMY49eIgx+PJIBX15g148RzI7Psi8kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=lFt/Y8+7; arc=none smtp.client-ip=198.177.127.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="lFt/Y8+7"
Received: from [172.20.10.14] (unknown [39.144.124.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hn76X5q5Pz8sWP;
	Sat, 19 Sep 2026 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789818503;
	bh=Jdbtc7DFhLtiUWh+PEh7yNbUvxZT1UPsUi0m/9Hg6oY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lFt/Y8+7Md0a5mjz4gIRy3BF9KMoB26hGRveEjZPvFwL7XAXCtGft/NoBASXX7lzy
	 JLPlWtGxDZzUwnmeACjwBG8UFREbG2c8lT2VRzVTxvVQh1JYXh8DHYxxnGfRzFH1wP
	 tsaAXFC/lCFSM960x7rCRTOjCdz+imC0ngWW6VpWHOBdG0MMPbbMo2BXkmH3AJL2HM
	 XQZr4ktfCMZy2sybll8FsHJ5LOdSeVhs1dZpScc8pgt4ukbRDpn25LPWw7w/jRhM6f
	 8ZPz0Q5inZP6UuXiVSBt9oEsW21mwd0vSuncYg/UXjY663wxGTWiwHWlmNVGPABtub
	 74XyxhyAX/VaA==
From: Tianyi Chen <hi@tychen.cc>
To: Quentin Monnet <qmo@kernel.org>
Cc: bpf@vger.kernel.org, andrii@kernel.org, eddyz87@gmail.com,
 ihor.solodrai@linux.dev, linux-kselftest@vger.kernel.org
Subject:
 Re: [PATCH bpf-next v3 1/2] bpftool: Read ring buffer maps with event_pipe
In-Reply-To: <de9a4fa5-568d-4be5-bccd-04340be59352@kernel.org>
References: <20260911025114.190899-1-diannaaav@gmail.com>
 <20260911025114.190899-2-diannaaav@gmail.com>
 <de9a4fa5-568d-4be5-bccd-04340be59352@kernel.org>
Date: Sat, 19 Sep 2026 19:48:15 +0800
Message-ID: <178981849513.1262776.17093336533785961556@tychen.cc>
X-Envelope-From: hi@tychen.cc
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Hi Quentin,

> Let's adjust the functions to take multiple arguments, instead

Thanks, v4 follows your completion proposal and also addresses the
argument diagnostic, p_err() and redundant-comment feedback.

> As bpf-ci's review says, please look into reusing the existing helpers
> if possible.

The test now reuses detect_bpftool_path() and checks the exec-error write.
All 18 subtests pass, including the new unknown-argument case. I also
checked completion matching and plain/JSON polling-error output.

v4 is a new thread:
https://lore.kernel.org/r/20260919110721.1230756-1-hi@tychen.cc

Thanks,
Tianyi
