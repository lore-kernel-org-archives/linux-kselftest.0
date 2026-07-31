Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314C3E1694;
	Fri, 31 Jul 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492838; cv=none; b=XQRhlh3Rg7oTI25V043s1pQ6JcfwMCb/3yQdpXU1ptfzgHHuDONxUaiLDaELZGb5n/I8d8gJYc1TM0+58dJ9559maO0j/1947Vggi5PWoWh+FmkXvsStj01Bwjo86mOP7r8OXovisDIt/ysgFiHeEsV5JENlMsEeCGdKt/QmjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492838; c=relaxed/simple;
	bh=rI4kD2TwEQlbmRB9Uvl6bgmy4k9IQvZx1edgQ1gLWsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XV+uzma6pqfzo1YyOmfeHBpoDO693oa5AFfAMF0pySkNbyBobV/SbiTIYUudXOu0xOTlUC7T6KuVaw7763dW66NLLzelOQWsRPYdumxWCDUPEaxVew/zvCMc9Oi3HGwTKyVwgP+0XGcNROoHsW9CS+MVxV/vr4BtXG835UEM0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=MYYIYtx2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="MYYIYtx2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xv27c0/vD/Df/b4Y/cIi4N2Epf5NFx+e9qZ5FbCg3WY=; b=MYYIYtx25XZoY10teoNoDLot/E
	Gl9sbTwyvUQ6S0g5EIbUCl+mr6lZVAfMUoeka7/OYi6q25930ikXJMu4itu6NyBTiSfjit93Hv3xm
	rzBoWiFMrELqo/27L1V0wCEQ8Go7WUjnhMQ1I5ow6p9jWnT33J1Z8tbXfjYKCovV3UVt7ayuN7ilz
	lZIe5uH+WaOOXwoUcJhDOqkfklhFMi+bHhhvAL/fXfFa2MfRBONhcEXgH/6hGcq7n76ik3ZTFAGBi
	PlViSh1cEXzz6f7rWorRnvX9mKWcX54xMDD2E9gkM3hvm0cljVTFVF7f/cf0sVJTwhwTg04HZO/83
	TJxDTG6Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wpkF3-009wAq-1P;
	Fri, 31 Jul 2026 10:13:26 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 0/3] mm: kmemleak: default min_unref_scans to 2 for
 verbose kernels
Date: Fri, 31 Jul 2026 03:13:03 -0700
Message-Id: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC91bGoC/33NQQ7CIBBA0auQWRczQKumK+9hGgMyLZNaMGAaT
 cPdjT2A2794f4NCmalALzbItHLhFKEXuhFwDzZOJNlDL0CjPuLJoJwXWh5k51uw2VMkL+mMXau
 9Up0eoRHwzDTyezevQyMgcHml/NkXq/rVf9qqpJIOnUY0xrXOXTw5tvGQ8gRDrfULAi/+m7MAA
 AA=
X-Change-ID: 20260730-kmemleak_hardened-e80542d1152f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742; i=leitao@debian.org;
 h=from:subject:message-id; bh=rI4kD2TwEQlbmRB9Uvl6bgmy4k9IQvZx1edgQ1gLWsk=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqbHVA+cxEjDiwoAAfP34NakpeN+bDGV7HTNug6
 phdzcYHNhOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCamx1QAAKCRA1o5Of/Hh3
 bQYmD/4vgOFaWo7gi6XQJHUDIJpkx64lWbF6oOsiz9aXuHUj0eWlHY247RHDUkkSrHA4RPLHVwB
 8yOO0FqFxl9Aq61ahvmzNu/e3ydpOdB6PEIDDZnaRs7/IWiBZwBMVMnkza+NG6nLTN1D08UtFGE
 aZax4IGjtqWLmhQiCAj7Ti3C4OQn8xiPx8UVTBKVAgjOobr0Lf0pl+RKsSufunk48xYzQFWIFGe
 uwen6kuEq3dxgmeZaAW9adl0kYVyWSzkKhyxSOuRIdGEjQ1GdVAglQFhB6OmiX0UHHSjUr5xe82
 DJROxYxZKkXo+HZZwLNcEl34OXGrEU8VsfSGIwx3DqLjAm/QRYtQOJipkp+iAWdLyxh2upoKet6
 athzJlL1Fylw3WccUK2kZESu679j2EfpoCPsRvrFhVg8zDI/m0r9xWudsexomB8xzV8ObizDDhI
 rAia3+qMrvxtxwmOgy9uPrgMRZ3ZZlIvToQuUhxR19cfp9w0fBj2O3GEOB5/b65UDpzc8RJgfRz
 L7YMWzcbKB4C4bi+ggAqJZdxRl+NPW+S03Fx6NiNsGkOxADK+LJ8ltxhDeRm27n3FGKDKMjUQtf
 MvrNmhaddv5FZgpP5sKdMT8Yg4lCjIH2ImUDAA3VbAho2JBRwEyS/3RS8++ivDA/UbEkCjn6fcB
 DkbErejp9H9e2Ww==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When CONFIG_DEBUG_KMEMLEAK_VERBOSE is set, which means the host is in
auto scan mode, set min_unref_scans to 2, avoiding false positives.

CONFIG_DEBUG_KMEMLEAK_VERBOSE depends on CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN,
so a kernel built with it already runs the scan thread periodically and
the user has asked for detailed leak reports.

The confirming second scan comes for free there, so default
min_unref_scans to 2 in that case and keep it at 1 everywhere else.
CONFIG_DEBUG_KMEMLEAK_VERBOSE defaults to n, so nothing changes for
kernels that do not opt in.

The other two patches bring the documentation and the selftest comments
in line with the new conditional default.

PS: A similar patch (v1 of this patchset) is applied to Meta's kernel,
in real production hosts.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Test only CONFIG_DEBUG_KMEMLEAK_VERBOSE, which already depends on
  CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN; the #if block becomes a plain
  IS_ENABLED() initializer
- Note in the changelog that CONFIG_DEBUG_KMEMLEAK_VERBOSE defaults to n
- New patch: update Documentation/dev-tools/kmemleak.rst, which still
  documented the default as unconditionally 1
- New patch: drop the stale "default" wording from the
  ksft_kmemleak_confirm.sh comments
- Link to v1: https://patch.msgid.link/20260730-kmemleak_hardened-v1-1-b0b20033b4bb@debian.org

To: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: David Hildenbrand <david@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Breno Leitao (3):
      mm: kmemleak: default min_unref_scans to 2 for verbose auto-scan
      Documentation: kmemleak: document the conditional min_unref_scans default
      selftests/mm: kmemleak: drop stale min_unref_scans default from comments

 Documentation/dev-tools/kmemleak.rst                | 12 +++++++-----
 mm/kmemleak.c                                       |  3 ++-
 tools/testing/selftests/mm/ksft_kmemleak_confirm.sh | 10 ++++------
 3 files changed, 13 insertions(+), 12 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-kmemleak_hardened-e80542d1152f

Best regards,
--  
Breno Leitao <leitao@debian.org>

