From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 11:46:30 -0800
Subject: [PATCH v3 bpf-next 4/4] bpftool: support loading flow dissector
In-Reply-To: <20181108053957.205681-5-sdf@google.com>
References: <20181108053957.205681-1-sdf@google.com>
 <20181108053957.205681-5-sdf@google.com>
Message-ID: <20181108114630.28907570@cakuba.hsd1.ca.comcast.net>

On Wed,  7 Nov 2018 21:39:57 -0800, Stanislav Fomichev wrote:
> This commit adds support for loading/attaching/detaching flow
> dissector program. The structure of the flow dissector program is
> assumed to be the same as in the selftests:
> 
> * flow_dissector section with the main entry point
> * a bunch of tail call progs
> * a jmp_table map that is populated with the tail call progs

Could you split the loadall changes and the flow_dissector changes into
two separate patches?
