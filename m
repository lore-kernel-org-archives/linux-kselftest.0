Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A773E4C61;
	Wed,  3 Jun 2026 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780510623; cv=none; b=jUA7S0NgdJIqryKWK2bQGwSyqa5vsvyQ3Yv/ejlJ95cgPCOCw7wUYN44fD9kVfUzSfaiO9rJGwRpn87p77X+ezbgQGKMoxkSZPZGz/aunIkjzdOAVrspOBCLoIG4raiHxL/vfBvRaUSJoHs4Tak3vmZbgGKIAeFi4+iiNINKmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780510623; c=relaxed/simple;
	bh=iRiWIraVsGgmw29IifxJAhl8Y674/tWWwsgW74JyFCw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MRdnwhZE4NBW5ZFDxKL7nQFUXKEdpUSFrc3QPxzyeSZWYOd9gaMHs+0yIEq/4ICAPIcrDQrZvGk/SaUgP10Dtg5NmT8R99L2tYIqDdo9WP0DVYnwdW3656/uPrDZhxmW2+n8o7i+5IHmktuSra6x498rZNE5/t3+DDNmjU0u6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSLKO+Ut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSLKO+Ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5594A1F00893;
	Wed,  3 Jun 2026 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780510620;
	bh=nxQ22KcJJP7bVCdFVSScm4T4WK7bH7Ys2cqAdls6sJQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=YSLKO+Uty9Cb7gb0+g+YURmGlAfgJDL1bkZ3upC7pCzRW257ES511XK59cObIdiLp
	 HQLBUG3vDvVuHsHby5F8udil1Anpb1xIEsfKK6txziKZubb3wr6xFoqqDdA6qeIGi+
	 IlXPtzuptxb2JFv/3bKMtDLvilfFAJF/lDPbXMlmFK3r0ygLOVQbjzEtiVBB0FTZuH
	 IhdHRNMtb/2RYH0gjiarVrBSivGLVN6SJ5wOArrtGfyPFukeCboLnQBsBtzGIKDjda
	 SC1r3BaxKQTAvqhGzJ/IlLGkLhuWSL9lCQwPbyV0EZsAaZEv0ok9PIFUHxdq9AFQho
	 nY/BZsoKlHezw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kselftest@vger.kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com, 
 Pasha Tatashin <pasha.tatashin@soleen.com>
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Subject: Re: [PATCH v7 00/13] liveupdate: Remove limits on sessions and
 files
Message-Id: <178051061274.867224.3632796902576075261.b4-ty@b4>
Date: Wed, 03 Jun 2026 21:16:52 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 03 Jun 2026 15:43:49 +0000, Pasha Tatashin wrote:
> liveupdate: Remove limits on sessions and files
> 
> Hi all,
> 
> This series removes the fixed limits on the number of files that can
> be preserved within a single session, and the total number of sessions
> managed by the Live Update Orchestrator (LUO).
> 
> [...]

Applied to next branch of liveupdate/linux.git tree, thanks!

[01/13] liveupdate: change file_set->count type to u64 for type safety
        commit: 81fbb909ec07868415f6b2269922c8d1cc6a215a
[02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
        commit: 6af06e11bd48bdefaf9381f6ff0bd65b1e5d98ab
[03/13] liveupdate: centralize state management into struct luo_ser
        commit: d376e4b55c9a0adb3e701c7eaff21d9ba655a1c6
[04/13] liveupdate: register luo_ser as KHO subtree
        commit: cf071b3536df76a2a75b83ca1fe8c043824352c3
[05/13] liveupdate: Extract luo_file_deserialize_one helper
        commit: 51b71af922a7145e63fdc0cab075d681ecd89e4a
[06/13] liveupdate: Extract luo_session_deserialize_one helper
        commit: be9d10d167652e11283cd07c7daf187222808db1
[07/13] kho: add support for linked-block serialization
        commit: 0349ff2887059112ce06831ab29aec47a2a7285a
[08/13] liveupdate: defer session block allocation and physical address setting
        commit: b5a58a922e6f2f9f40faddd8e0e1fe3ce0ea9c56
[09/13] liveupdate: Remove limit on the number of sessions
        commit: 2a441a14c2c03b39d1c89438dd28cef9d8fa57d5
[10/13] liveupdate: Remove limit on the number of files per session
        commit: 1d1153097f4dd417e2ea00404edec9fbd1d88f28
[11/13] selftests/liveupdate: Test session and file limit removal
        commit: 5ba3f30643cbdd79fb82e525aa1ca55b62fcc7ac
[12/13] selftests/liveupdate: Add stress-sessions kexec test
        commit: 3432292fb9130191dca57953941f7ae3888d52d8
[13/13] selftests/liveupdate: Add stress-files kexec test
        commit: 46429a15a6dfe522880d5085f1f6999357758872

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.


