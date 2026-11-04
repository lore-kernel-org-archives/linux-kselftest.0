Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811564;
	b=VythKL27uC1gT5t0SQSiNT+HS1oaJWk6fqUU/D7Wg5NLgGKY/yHpQ+qOpEgrligb9Q8Y
	 t71hZrieIFdRA4JtVwbzo5Df3ERlbDihkIw2m0FhSYydm0QqUVxuNxQzAbkoiuyiSO2xq
	 Fkk9ox1TG1EaYUpjnUhGTwjndLuCYVXmMRgPvv+fmo89XyCMn0OgtI93nv7yokZA5N6ML
	 mP7XwyVt1SZw/8GEBMD0Cm1a/xfPyAv0HDmxbUXrqGzoKXH/IQxVmoqgRM6RlWKnZFfAT
	 YTyXY91NwW8fF9lON3q2Rh8F9OOpzI6nyBzC5vWgMnxJ5kOKRzByKmkHalDZGmTVnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811564;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=4ChK0INPk67gm1yU3y9ycjg3DavhKidCa/NOKnRXt3E=;
	b=r+1KJB+4ir93N2mIhwiS8NGWVtr5Q7bi8ph8aHK7RKH255wHf0LUCePlODGdbHiEWj/+
	 tz7evTlyC/z6GqbZCAs+Seybp6/GEVdDq9Hc1USGdnsG6OuBgyF6BSMkP90kPSjiV3Zdn
	 kDlUmuGj5ADkT33ynyTme4AuM9DxNGdGyvPWtmo6t7newTxLPkTHuFh8GDttqQmN3U8cT
	 muaUfQu1S8WFA5tFvPfEoDVm3C7U715+OV2lRhh1BbGoiyknTg2nFC9BKBhOVPn7vsIj9
	 0fKFmXtPWOKpFTZ/NbUCYmAvj+sWBC8EF85yvjZOo4NX6bd0iHRTj4ZYLupJ5QVqyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e1IltH/h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76214606D83F;
	Wed,  4 Nov 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e1IltH/h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768EB1F000C1;
	Wed,  4 Nov 2026 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811564;
	bh=4ChK0INPk67gm1yU3y9ycjg3DavhKidCa/NOKnRXt3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e1IltH/hwj2W3cR9SklfIBuPpiVdyAm/FwepfN/AbRq+r8/IbUR3jqQcUVHkVJ80C
	 06+cz8P8GC+/B3dQEvITq/W+IOwGtPORC1nuZoa/6OKutaQGnsh83PiXBnA9hes95x
	 EPqBgYzbCWN4QjyuZGXgMfRbQEIim8rvmmPr5uktGj+13/5AvaJJHw4UbVjaULZ2tK
	 pCDl6L1xa5eInJrm6UBMG3QojaQTUDyGKuWXwm1yAFbOvEUusx9/f9j6sGLzm20Ogf
	 BAEVoJuBMkBD9xBLFsEL4PZKuRi8DEIrQC6f5DA4taC8fdjRcHOrNyLQw38Yjcy+9r
	 5OL6kcEsw/Fyg==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for
 preserving tmpfs files
In-Reply-To: <20261103010216.3447716-11-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:16 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-11-dmatlack@google.com>
Date: Wed, 04 Nov 2026 17:59:19 +0100
Message-ID: <2vxz1p90jzx4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 03 2026, David Matlack wrote:

> Add luo_tmpfs, a kexec test for preserving tmpfs files and memfds, and
> for retrieving tmpfs files onto a tmpfs mount with struct
> liveupdate_shmem_retrieve_arg.
>
> Stage 1 preserves the source files of each test case. Stage 2 runs
> each test case in its own directory, with its own tmpfs mounts, so that
> block usage can be checked exactly with statfs() and st_blocks. The test
> cases cover:
>
>  - The restored file: contents, size, position, seals and holes, for
>    linked and unlinked source files.
>
>  - Creating the file: it is created like with open(O_TMPFILE), with the
>    requested mode minus the umask, owned by the caller, and not linked
>    until userspace links it, unless it asked for O_EXCL. Also O_RDONLY
>    and O_WRONLY files, other open() flags such as O_APPEND, O_NONBLOCK
>    and O_CLOEXEC, read-only mounts, and directories that the caller
>    can't write to.
>
>  - Preserving files that can't be written to: a binary while it is
>    executed, through a read-only fd, files on read-only mounts and
>    superblocks, and immutable files, including sparse ones, whose holes
>    are filled. Preserving someone else's file that the caller can't
>    write to fails, and so does preserving a file through a write-only
>    fd or an append-only file.
>
>  - Executing restored binaries: a restored binary can be executed
>    before the session is finished if it was retrieved with O_RDONLY, but
>    not if it was retrieved for writing, since LUO keeps the file open
>    until then. These test cases execute copies of the test binary.
>
>  - Block accounting: the file fits a mount of exactly its size, and a
>    large folio that extends past the end of the file is charged in full.
>    Running out of space, or hitting the memcg limit, fails permanently,
>    and leaves nothing charged to the mount or the memcg. The session can
>    still be finished.
>
>  - memfds: they are only retrieved as memfds, with their seals, and
>    files from tmpfs mounts only onto a tmpfs mount.
>
>  - Interactions with LUO: invalid arguments, which can be retried,
>    retrieving a token twice, and outgoing sessions.
>
> Also check that the size of a preserved file is frozen, and that the
> test doesn't trigger kernel warnings.
>
> Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases,
> CONFIG_MEMCG for the memcg test case and CONFIG_TMPFS_XATTR for
> FS_IOC_SETFLAGS. Those test cases are skipped without them.
>
> tmpfs quotas are not tested, since the test runs as root, which is not
> subject to quota limits.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/liveupdate/Makefile   |    1 +
>  tools/testing/selftests/liveupdate/config     |    4 +
>  .../testing/selftests/liveupdate/luo_tmpfs.c  | 2055 +++++++++++++++++

Umm, no way I am reading all this...

LLMs are great at generating tests, and I'm not saying there is no value
in this. It is just that this massive code dump is unreviewable by
humans. It is also unfair to the human reviewer because it took many
orders of magnitude less effort to _write_ them with an LLM.

What do you all reckon we should do about this? Trust the LLM to get the
testing right? Do we give up human maintenance of tests entirely? Do we
do fault injection to test the tests themselves?

Or do we make the tests smaller and more human reviewable?

>  .../selftests/liveupdate/run-vmtests.sh       |    1 +
>  4 files changed, 2061 insertions(+)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c
>
[...]

-- 
Regards,
Pratyush Yadav
