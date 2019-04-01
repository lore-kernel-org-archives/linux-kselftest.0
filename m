From: fw at strlen.de (Florian Westphal)
Date: Mon, 1 Apr 2019 21:45:13 +0200
Subject: about selftests/netfilter test related issue
In-Reply-To: <CAG=yYw=VMJ5vK9aXcZ7AgC7f_dx+5ebKgwz68mV3=m6pOA_syA@mail.gmail.com>
References: <CAG=yYw=VMJ5vK9aXcZ7AgC7f_dx+5ebKgwz68mV3=m6pOA_syA@mail.gmail.com>
Message-ID: <20190401194513.e3ck3ze5peyvvfam@breakpoint.cc>

Jeffrin Thalakkottoor <jeffrin at rajagiritech.edu.in> wrote:
> i think the script nft_nat.sh  is assuming devices eth0 and eth1

No it does not.
These are arbitrary names given to veth devices.

> Error: Unknown device type.

No Veth device support in kernel?
