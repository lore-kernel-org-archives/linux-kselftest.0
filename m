Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882383F58E0;
	Fri, 31 Jul 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492828; cv=none; b=G5mfX/qOIgfRUpm9pexJXlzLeWUda2L4/LdTlJutTizKAE5hSzBH7uZEoJgVRI+TVKje5xpzMq0iRcIZDPuf37mX2XMG/rHBkrdsZvergslrVh+wHPUnvVjSSw2s8HJcq5OAl64mQeApIZAoHhilljnRl+T3dTC0cBhB+nZ+LIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492828; c=relaxed/simple;
	bh=DaAs9v2s48e9JMFkP+I5JIQ1sntx0U1Ktp2zFL4yLtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFQWz8jMmzshzK+nRXCXPvDdj0rxVm111Mp0SFMJgnPcmiOyKzs79osvYkk24nKjkzFnkZyME+F6mB1dg8xDU1z+fwneZGOBAV6OXfnUiUfC6wN1GQ1XFHGykLS+zKHpIX3tBoBF1q4fUaPYTZmhHCC5kKpPCNy2Hk6ylIWBvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=u59+EVoG; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="u59+EVoG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=8LK1SF//t3va2bThbeH1OWK77lJlFXbCBS1qpFyGJdU=; b=u59+EVoGC98m2JEO8LFmuFQs7B
	Y02NU7GEnkp3ZquWsk1yC8BpCD5AuwZhSzGdonKvi3ahW/ninNrLBONNa6FG8XQpSpbM+wocf8QWq
	Fjxh7MVNmvPxZq5fg1YPykGNfHtcDlf7yyCz4iyZX/a35i3m4AeKLu8Oy5lrODICFpXQtqmK6FPsO
	jRsh8T409Wr5ZJWVFD0Vk1G4kY5E7ijUsKZVaFIyl8OU5fOB3fGUyZ1qwNQHUSqIXVTVVD5rt1mqF
	HKi34LuInZ2UD/YYZD9JO7d7ZOs8PTQWSkcuityzhDigolK1ICf1mt+d5mTokX9aQCm8ZzPO2rE08
	eilgjXmg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wpkF9-009wAv-1O;
	Fri, 31 Jul 2026 10:13:31 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 31 Jul 2026 03:13:04 -0700
Subject: [PATCH v2 1/3] mm: kmemleak: default min_unref_scans to 2 for
 verbose auto-scan
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-kmemleak_hardened-v2-1-7b9689ac77cb@debian.org>
References: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
In-Reply-To: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=leitao@debian.org;
 h=from:subject:message-id; bh=DaAs9v2s48e9JMFkP+I5JIQ1sntx0U1Ktp2zFL4yLtE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqbHVAsT97IECXFQK2T5y0rTmoAdJIv7jKa0scr
 gqh/l+QROyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCamx1QAAKCRA1o5Of/Hh3
 bR2MD/96NkIxUrTkZVumh95rB23L+q8p7ZqHB7FrhzGUp9KmBdL9RzmuB6fzjDt4Zwxi7z4cSLb
 hD3eJUmI8k/xCJW7LAV1nvEieJq/GrowJ1YCvvbFyAVXq3xT3CX61ppzdrpTgZt8/rgfqApHikg
 OwPaN1FJ9rBWIDqddC+tQGi0V6Ra1w6fsnyEv1GfWXjEXiyXuzEyp4/DRdOrh5feJH/M6l9oUqk
 RpEKaMNlV8C5gGF3AXJSpaq9pRgGGW9+3Z8hpWROdbd1r7j5M/UpVWzoW8wmuSv4RcUmcPduQF5
 gtzK0DOCHNQlBTLjLm3foQBGw0Z+Gs5cQEEKB4xCFLir4I0/bmEE3zLeGcgN9nlX86yRC31GMHe
 OBFDJo+oM2MX5cnozIEfpyxQ+iy22Wm0lxMpSzHmwMqjk+RgBMySL2Sr06+u3StGLSNcS9T1VI8
 cRn0gbnACMoT8TfNkMnDsbA+tGm2FLg4Z/79ATyxCl2PgxRW+R6Ah0P9uXMZhDUQxPNbFzWBCh0
 pEJv98e5oFLqKiX7DYNq5oe8yR60A0VxG0Tpqz4hmZf767Afdq3RwjKaWqPMvsZe+X0KZaEyH7O
 hIc/yiosrztgTH6toi/L96B3EeYq9hBeW6wUjDaBf6QUiDN6ePrYuc9LkNknlDOKKbxRboYRLRE
 5W+Cz3RXAYaVEyw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

min_unref_scans defers reporting an object as leaked until it has stayed
unreferenced for that many consecutive scans, filtering out objects that
are only transiently unreferenced during a scan.

It defaults to 1, which reports on the first unreferenced scan.

CONFIG_DEBUG_KMEMLEAK_VERBOSE depends on CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN,
so a kernel built with it runs the scan thread periodically and the user
has opted into detailed leak reporting. A second confirming scan then
happens on its own.

Default min_unref_scans to 2 there to suppress transient false positives,
and keep it at 1 otherwise, where a manually triggered scan is expected to
report immediately. The value stays writable through the module parameter.

CONFIG_DEBUG_KMEMLEAK_VERBOSE defaults to n, so this does not change the
default for kernels that do not opt in.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index f63dfacee7ca1..8fa409a4f9fb2 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -237,7 +237,8 @@ static struct task_struct *scan_thread;
 /* used to avoid reporting of recently allocated objects */
 static unsigned long jiffies_min_age;
 /* consecutive scans an object must stay unreferenced before reporting */
-static unsigned int min_unref_scans = 1;
+static unsigned int min_unref_scans =
+	IS_ENABLED(CONFIG_DEBUG_KMEMLEAK_VERBOSE) ? 2 : 1;
 module_param(min_unref_scans, uint, 0644);
 static unsigned long jiffies_last_scan;
 /* delay between automatic memory scannings */

-- 
2.53.0-Meta

