Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39626F2B0;
	Tue, 10 Mar 2026 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104031; cv=none; b=D9ONdJq3CPrK/vHsPUq3cpIXiAJUWlqeD0/dUB1x8ZmoQE5W4thTeRPK4/E0oWjrk1L4BGCM4B24wyum+65yttndbG3PM7FKA1A8AbGiyLIE2V8cKGbXBZ6sH8ZawH8o/6kVkxQplZyBKDXzU/UsRgaHJBFdAnWNzMNMh1bHUgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104031; c=relaxed/simple;
	bh=3Le3mBs7FcChT/7kjQb1K8IZV0TRw1CdA3Cz1ItHUqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1vjSVWnH/N47gACBvhIndYIopFubdBvG17xwjORgjeC/dAioMgRL+gn/ultDDm4J6RVih3apKJCd9GgEhg1iMHfdVpfg0q/QlEPKvlLhjTtw9fINdZjBf/EjBiwad4toQowvMwETBXSPlOM+ibP4DclhhArC37HWwGGoQ0dpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyes+lfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyes+lfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF37DC2BCAF;
	Tue, 10 Mar 2026 00:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773104031;
	bh=3Le3mBs7FcChT/7kjQb1K8IZV0TRw1CdA3Cz1ItHUqk=;
	h=From:To:Cc:Subject:Date:From;
	b=Fyes+lfJtFd/zZTAX430NwxvRNHAi7uxrPE7pV3UQ5sUZcHjMrMInzB86ROldDhTe
	 9nrss0aHuIAeoC8oTYNbK0h64Y6Mw6jymBnRM8JwAoZ8lBvMzChkRcZVFPdHMlvNL5
	 fhyTqlVzMbe5n/Kn5QJVQJYl/sHmEfkTJaqJbd+v1NVOKG7/oImkoagItJe/57Jndg
	 ZR53MpH/kl+WwS0eSbw39r1sQ23FKsKbnS+dPF070Q4wd8K2nbkxKHML645VJ9YQPX
	 /tSxorMvBdgR9/cS6G0nbDBJrKsPXqHdg+i1YtXkFkEMpbdYGP+oK4OV+dqUvTXMc8
	 K9n1jMU87FiHg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	donald.hunter@gmail.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 0/5] tools: ynl: policy query support
Date: Mon,  9 Mar 2026 17:53:32 -0700
Message-ID: <20260310005337.3594225-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the Netlink policy support in YNL. This series grew out of
improvements to policy checking, when writing selftests I realized
that instead of doing all the policy parsing in the test we're
better off making it part of YNL itself.

Patch 1 adds pad handling, apparently we never hit pad with commonly
used families. nlctrl policy dumps use pad more frequently.
Patch 2 is a trivial refactor.
Patch 3 pays off some technical debt in terms of documentation.
The YnlFamily class is growing in size and it's quite hard to
find its members. So document it a little bit.
Patch 4 is the main dish, the implementation of get_policy(op)
in YnlFamily.
Patch 5 plugs the new functionality into the CLI.

Jakub Kicinski (5):
  tools: ynl: handle pad type during decode
  tools: ynl: move policy decoding out of NlMsg
  tools: ynl: add short doc to class YnlFamily
  tools: ynl: add Python API for easier access to policies
  tools: ynl: cli: add --policy support

 tools/net/ynl/pyynl/cli.py                |  12 ++
 tools/net/ynl/pyynl/lib/__init__.py       |   5 +-
 tools/net/ynl/pyynl/lib/ynl.py            | 216 +++++++++++++++++++---
 tools/testing/selftests/net/lib/py/ynl.py |   6 +-
 4 files changed, 208 insertions(+), 31 deletions(-)

-- 
2.53.0

