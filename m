Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C13B19D0
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480228; cv=pass; b=PDeM7WU4zPRvGPopiG2q9V0KqKoyQGAGXig7PuUdaxsEDgEXPE169wzj2vCco9wJVYhXJnJGE77b+iufA99FuhCyJt/v+17yjntDZsKnYVz9kT+PGGS2gcjKPbqcA/i8JDHVQj0xHDYB5kRPQiaswvOh96MeTHHufcicHDSBPkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480228; c=relaxed/simple;
	bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnFAbwdPpRWjoZx552EUPr3GWlrRLG4+rFaGiL4YsPSeRCyH/Jint79mls8Sb9WXxhOBKr/hjlAX3hF75fJb93BDS+93R9v91lLrqY+RQuss/15c+LfF+PGN4nL5Rc3OVbGAnr3+446DnwE93x0sQ+dOI+yJxznoJUiSd6XI+gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IqAzqNAQ; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IqAzqNAQ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1419d3416ceso10614251c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 10:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791480226; cv=none;
        d=google.com; s=arc-20260327;
        b=RQPaosnANnfwsUzIRCd1WcnP9Vd+w/9sd/+T/Aj/w2fgQKu20tLYFbKGckCIpjFWdy
         2pSP0wovezIMSwePvBs2im9iwOUhMSTlDGV48i75/N0txsGLDhrCgmPzhKe2RhXrYIZP
         E2S/WHMFPY5qh4vi/Bi6Gn0zkfVwdAJMIsoQG94EhXFqFVoBgBMEmx3q20eZZiFQ8pu8
         x6RWGvZp5tgB5D++O1rHLu5PLoxvcpw600c2bZxk1ZpIygTEUXqYS17Pd6kTPd9uzx2J
         R2odxImYJRsjXQCotpqxfQz0Rg+8Q2HxifCOFihiOd69nmUAofn3kni0uiI5PyaCJWEF
         Wj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        fh=Hq99SCLr+eEvT2vJjtvC/M583UJCZEdrJ/7GvuGawOE=;
        b=VdtKhVzln8tIJLdmcoELMw0eBY/+QNO0KEVWwzkpecaECQZhkg7f4HZYolzkyJtoBJ
         Ts31JTtDsnKPJUIeR4jtaLudhq6fblW+E+9NrORQmias1/LqpRD2BKDJnTcO1Kob12pH
         fsjpJ8k+imCmBnyPi7ciI86XPTZL3sVcsyIKqfvhOf+XDMX/BjjeBvJ4neEvjvq4PNrO
         KS8GIZJ12995PwsZSfi5YPP03cGBTQj+HrhwEvE5wK4YzK/V0iUhgWH2KPk1YI3Op7i/
         aKRgGltKtg8aOsbyxTJXSbqmm+G/z2KMu58lSFpo9keK2/TOug2587CsxbRIde5pCicf
         h4KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791480226; x=1792085026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        b=IqAzqNAQnNWI854x7LFCrWtlAzk0S4Q9IAI1wrs/acQcz0+ir6N7uyBxFCZa3m296G
         sBHp0fEvmrtIkHbMhAYIuNJ6ul+xLWI9PHPdAZnQMg602lDCJcwhIKbVStYx3kqWPNFH
         lTSzFKq+Oe3uQwGIvgtye9uclyQeCBERRgMC0HwppYCPM8zeYOOEWicHZK1r4KHk/n1J
         gkptt64FWittcYLHyeJdjZvnNM+oDiWb8p8yISdjjiJiT5PwazwoXVyX/xVwGC3QraCg
         9rEevCsYmulYsDT7golCu75qsi5/JMfzcZsWq3q67e/eXOeesPHrXgajCf4dzLNcmk/c
         X2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480226; x=1792085026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        b=eIgSJI5T/EvTziTp5mmOILhmBvLeVggPcXcvbIXgRxGxPhhhxkd2vEfti9kOQRDyfA
         CgVx+yvC7gNRhKiWiMzi2rnGfJ7b3nKhWJZi2XXvFFEkg9lT/TV8qqjKQxdOts6HlSaz
         sncnuTjDKeVu4G8/x8k/9/lyZEjmz9Nvtm34xXkkTwIaA1XXO874oycAOxYeZZ6KL8g6
         3guFvJoZs6zQ1N9izO54/E5hBju3fpNYYPb18yGr5QWbr8FohGw97vTi4jYsWzsWg8bT
         Qf+UoSRV/cdTERaz6W1Zil5Pg0UOQGsDYPA6NMk4cL4OaJyj5teakAOohWRmIByQayqs
         BRtg==
X-Forwarded-Encrypted: i=1; AKwUvBzLhMfiqMHUdKuwZPLkBxEpMMxrnChtlmT4Tb1nfUXVxypihiWL1tBm9tpQArsUwJYg44a28syexmG7pnQ9kMY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1tVXzJa+4GQMI1bnjWE2KDdykrd8/TtGYkhelm/SeSPXbUENh
	2a3HL57VPRLiBI9Bm1fuvuAWsFvRP7W8XYt0IXvba3qgHS8qGFBRKwLTj9QnNFlGZdYSCVoTtXj
	6xynL5ITne8GvwDYa17RDfghjsz3OOGDO+JhvUPIt
X-Gm-Gg: AYBFou20NJQRWfzqxJydRPL3Mxkt4bDsWprqjSgOLoXSrnEZzsY8yZ7wiuGZCQ92BAS
	NEZKsSfbdOG8RFveD2d/ApeS+lm4gB42BjeB6Pr2LpY74W5e8r23IHTFyK15Kae7y4ZD/RWkZ5l
	534IxDBcxYAd8smWZ+/WrGOpXtJEQiRuSbg0Tvk9Re8+KKnigO/uwFrIdzbu+NMIqjOVgXZTcmr
	e9yOTZFhhAeDq7x7tl7IG7NHYSzD7dCA2my15SXfviY19Oy/O+7289X36StB0nQnIdiq4L95zEn
	fPWjW3xfEniv8nqXXtMMtj5GIPNCaZdgLOeRa8BQUYwSL/5ZYudvxxkoUSvntdU8HBoD/KX8Q3E
	qRXaq1FhbcilQWcZdUUg56LvDK5vrVrzRaS/MDopmkHYbmFEBzQf1YN7p4boVRBex3JZ9dT0+UV
	iwdk6cLBNcNxl3J3bCQCgGdV5L
X-Received: by 2002:a05:701b:290e:b0:166:4b25:8bbc with SMTP id
 a92af1059eb24-1664b258cabmr2798079c88.32.1791480224884; Thu, 08 Oct 2026
 10:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-selftests-sockmap_listen-cleanup-v1-1-f6d1a4ff540d@rbox.co>
In-Reply-To: <20261008-selftests-sockmap_listen-cleanup-v1-1-f6d1a4ff540d@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 8 Oct 2026 10:23:33 -0700
X-Gm-Features: AclHuK_ZHezGCVBzzMpcKC3XD4J4SlpbuSoU0hDuFFatZm_8hkKxjtuQCg6wZOk
Message-ID: <CAAVpQUAaNR_vJq00dG67uxe=Yp18V_RG3Vxr7KL2u=dF7fBfKw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Clean up sa_family_t-stringifier
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:12=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> Following commit f3de1cf621f7 ("selftests/bpf: sockmap_listen cleanup: Dr=
op
> af_unix redir tests") and commit 9266e49d608c ("selftests/bpf:
> sockmap_listen cleanup: Drop af_vsock redir tests"), sockmap_listen.c:
> family_str() becomes functionally identical to select_reuseport.c:
> family_str(). Move the logic to socket_helpers.h.
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Link: https://msgid.link/CAAVpQUDULzZh58oKkRaYqgM9bRToGb7wHrzT+cZNpRmAtM1=
2Ow@mail.gmail.com
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
