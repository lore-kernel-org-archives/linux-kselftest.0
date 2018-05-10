From: guro@fb.com (Roman Gushchin)
Date: Thu, 10 May 2018 18:04:16 +0100
Subject: [PATCH] selftests/cgroup: memory controller self-tests
In-Reply-To: <72680d54-a0c8-434f-e95c-ab8e4c7c854b@kernel.org>
References: <20180509192016.24944-1-guro@fb.com>
 <72680d54-a0c8-434f-e95c-ab8e4c7c854b@kernel.org>
Message-ID: <20180510170410.GA30242@castle.DHCP.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180510170416.czt-bsdq0-VElBDA_-Ow_sj260th-3lky3OeKjHon9k@z>

On Thu, May 10, 2018@08:25:06AM -0600, Shuah Khan wrote:
> On 05/09/2018 01:20 PM, Roman Gushchin wrote:
> > Cgroups are used for controlling the physical resource distribution
> > (memory, CPU, io, etc) and often are used as basic building blocks
> > for large distributed computing systems. Even small differences
> > in the actual behavior may lead to significant incidents.
> > 
> > The codebase is under the active development, which will unlikely
> > stop at any time soon. Also it's scattered over different
> > kernel subsystems, which makes regressions more probable.
> > 
> > Given that, the lack of any tests is crying.
> > 
> > This patch implements some basic tests for the memory controller,
> > as well as a minimal required framework.
> > It doesn't pretend for a very good coverage, but pretends
> > to be a starting point.
> > 
> > Hopefully, any following significant changes will
> > include corresponding tests.
> > 
> > Tests for CPU and io controllers, as well as cgroup core
> > are next in the todo list.
> > 
> 
> Thanks you for the patch.

Hi Shuah!

Thank you for taking a look. I've addressed your comments in v2.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
