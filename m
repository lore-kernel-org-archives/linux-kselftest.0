Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581025;
	b=JnAUtsDLzjjD2LsNO2qUrcL/2slYEr6muSPsmfN2ocInMcGnop4DzhqGNRySzxArcSrK
	 BpQfJkZN0JeNWtKBshB/TGnddWla3w5UYPecImVpn2K8CLl0xVCnb4xhXz3LIp2Tmaky4
	 B7vQbhwrkKTRCXq/H6TvNI4DNIte97k6F71jSxeW/EdYil2y/QNMtHNpzXyo4vabZjBK0
	 3MCnKZAvBhxxoxGcMlcM6Q9QyJOPZGspB5nGsXMAuJfZMpAVscJhlZS5agrM8qNVXV8wH
	 dKm/bYtV8I6igVmDniPC2UBu+bdOfb9fdVX5Il3y8cVpsVPqWCIREsS26Dp8l0xrhQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581025;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aIJ1R3I3zY6nNLuEgbZL5CCKuVIRDzNDPBPjyXpoCSI=;
	b=1MS4sy3biaANOMrrWtM3Wy2go0axEkx2LEQs9u7vgXWFr/NZp0DpkASGFKogcWGbqgUj
	 lCi3tjrEvjK6uUvKxk28cdnXnE5zr1QKeozR/iOUEpQcy7IDiQvw5m5CsOdj+jPgnGhvM
	 TmoLrqC5sCJLrZ50E1rWzi0Y/NzaLC3gbWrGo4drLrvdermn8jx8Tvns8c+X1uiieuqAr
	 ImXfh0DDICBoF0kZtkZJN/dfKmS9pwe98g2mORjAK1xG1j4zYg+g9zdTMSFvoNs52bOks
	 v1Jz9PRfF4RIQoVN0lPYwjuHxltf5/Pd0Cd+hBNQRjVO6mgTXPQhs+Jz0ayB+YbvTpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chBHvI6M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1A606A330
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chBHvI6M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1461F000CC
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581025;
	bh=aIJ1R3I3zY6nNLuEgbZL5CCKuVIRDzNDPBPjyXpoCSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=chBHvI6McXSDpHb0EWEVc33PGomMAQ7sDtEdoNdx/Cu0Rbq/W/hRuM5cj8zLXytEY
	 3qEHRKcnBJour5iQixW57eDGNTvp22S/nugBuaewf20w504Ll1F0Giffoqu/D0/zDP
	 qUFjAZWP/otiqb5GLUAbqaVLV7/9MouBJgprqbWw5sfErJK69E0bISjPhbFRyEH8eS
	 IhYe5soo/trQszfwsezegv1bJp6YQjeYbApIe3GAd97d5UNE2pIW0jQQWNZqgG2gha
	 JLMUOV75nxrYW/iL3i2aqoUQC0b6CcmEtGBt6XJ1Mc6IICkt253ArfEeQ0upo9rQjW
	 0FPOyWuMXd4jA==
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eadef147ffso1943351e0c.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 06:43:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKBBBmWJ9HMbaSpQ5PEyNRHbWMGRrwUepmi/nDm9tstrrF6A3VHUSWn7kYL3R1Xupd7av5QOz+cTGI7aMsAV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pVGsPGaUk+hy1Ynvb92LdOdgoyH8XR+oCMayxstm6TA89athV
	J0bxq7ePFD2RSWCTGZYTJgoSm1qHP49DiUr5E4SX4uI/zEpAt9zFekJOiil7ol/Izt6bBQYOTzC
	/BWSgSf2Ruwq1n0OVziN6UsDbXUTnee8=
X-Received: by 2002:a05:6122:2490:b0:5c9:c60e:3a48 with SMTP id
 71dfb90a1353d-5ee34ae1ca8mr943708e0c.20.1794581024275; Fri, 13 Nov 2026
 06:43:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b9ff4d03-61f7-4e17-b048-3cecee70f3ca@oss.qualcomm.com>
In-Reply-To: <b9ff4d03-61f7-4e17-b048-3cecee70f3ca@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 15:43:30 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g5TFTknAZwmhuLvJuaim7WwqBVDmuPHan6ChTmQgu-Pw@mail.gmail.com>
X-Gm-Features: AclHuK8tWwNVIZk0uuz_ClJI2W7oD2KMYUmtoOxf6YQnxiXSC-VHM7u3YXnKAUc
Message-ID: <CAJZ5v0g5TFTknAZwmhuLvJuaim7WwqBVDmuPHan6ChTmQgu-Pw@mail.gmail.com>
Subject: Re: [GIT PULL] powercap: Add generic hierarchy support and convert DTPM
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Heiko St??bner" <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Lukasz Luba <Lukasz.Luba@arm.com>, 
	Linux PM mailing list <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Nov 10, 2026 at 2:21=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
>
> Hi Rafael,
>
> as requested please consider the following changes since commit
> 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
>
>    Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
>
> are available in the Git repository at:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> tags/powercap-hierarchy
>
> for you to fetch changes up to 6ba41a1519ff1f91f96d90a6bf4f70131a8f7c73:
>
>    powercap: dtpm: Add RK3588 hierarchy (2026-11-09 17:33:40 +0100)
>
> ----------------------------------------------------------------
> Powercap controllers may expose trees of power zones, such as packages,
> clusters and CPUs. This series adds generic helpers to duplicate a static
> hierarchy description, create its zones through backend callbacks, and
> destroy them in reverse order. Parents must precede their children in the
> node array; the helpers validate that ordering rather than sorting nodes.
>
> Drivers supporting multiple platforms can place each platform's hierarchy
> description and node array in initdata. powercap_hierarchy_dup() creates =
a
> working copy of the selected hierarchy and rebases its parent pointers.
> All original descriptions, including those for unused platforms, can then
> be reclaimed automatically with init memory. Names and backend-private
> data are not duplicated and must remain valid for the working hierarchy.
>
> The controller supplies creation and destruction callbacks to connect the
> generic hierarchy traversal to its backend. The creation callback receive=
s
> the control type, node name, private data and parent zone, registers the
> zone with its operations and constraints, and returns it to the helper.
> The destruction callback unregisters it during rollback or teardown.
>
> The API supports both fatal creation errors, which roll back previously
> created zones, and optional nodes: a NULL callback result skips a node an=
d
> its descendants while allowing independent branches to be created.
>
> The helpers were motivated by the SPEL work and also let DTPM share the
> same hierarchy infrastructure:
> https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d=
50f0c5b0@oss.qualcomm.com/
>
> A kselftest exercises static and duplicated hierarchies, skipped branches=
,
> reuse after partial destruction, and rejection of repeated creation. Its
> userspace script checks the 16 exported zones and selected attribute
> values, then removes the module with a sysfs attribute descriptor open.
>
> DTPM is converted to the generic helpers while preserving best-effort
> creation when individual backends are unavailable. The CPU backend finds
> an online sibling when a hierarchy's representative CPU is offline.
> Entirely offline policies remain unavailable during initialization.
>
> The RK3399 description is reduced to one CPU entry per cpufreq policy.
> The old backend already suppressed duplicate registration; the extra
> entries were redundant descriptions, not additional registered zones.
> Finally, a shared Rockchip virtual descriptor and an RK3588 CPU hierarchy
> are added. RK3588's three frequency domains are represented by cpu@0,
> cpu@400 and cpu@600 below a virtual package node; no GPU zone is added
> for RK3588 in this series.
>
> ----------------------------------------------------------------
> Daniel Lezcano (6):
>        powercap: Add generic zone hierarchy creation helpers
>        selftests/powercap: Add powercap hierarchy creation API tests
>        powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
>        powercap: dtpm: Use generic powercap hierarchy helpers
>        powercap: dtpm: Rename Rockchip virtual node descriptor
>        powercap: dtpm: Add RK3588 hierarchy
>
>   drivers/powercap/dtpm.c                            | 180 ++++++------
>   drivers/powercap/dtpm_cpu.c                        |  62 +++-
>   drivers/powercap/dtpm_devfreq.c                    |  22 +-
>   drivers/powercap/powercap_sys.c                    | 204 +++++++++++++
>   drivers/soc/rockchip/dtpm.c                        | 129 +++++++--
>   include/linux/dtpm.h                               |   6 +-
>   include/linux/powercap.h                           | 205 ++++++++++++++
>   tools/testing/selftests/Makefile                   |   1 +
>   tools/testing/selftests/powercap/Kbuild            |   5 +
>   tools/testing/selftests/powercap/Makefile          |  46 +++
>   tools/testing/selftests/powercap/config            |   3 +
>   .../selftests/powercap/powercap_hierarchy.c        | 314
> +++++++++++++++++++++
>   .../selftests/powercap/powercap_hierarchy.sh       | 128 +++++++++
>   13 files changed, 1153 insertions(+), 152 deletions(-)
>   create mode 100644 tools/testing/selftests/powercap/Kbuild
>   create mode 100644 tools/testing/selftests/powercap/Makefile
>   create mode 100644 tools/testing/selftests/powercap/config
>   create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.=
c
>   create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.=
sh

Pulled, but it had a small merge conflict with a previous cleanup.
Please see my resolution:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/=
?h=3Dbleeding-edge&id=3D95a9e882f5cb3ec891d1c021df3983358dd9b9e4

and let me know in case something is missing.

Thanks!
