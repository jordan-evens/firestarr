#include "stdafx.h"
#include "CellPoints.h"

namespace tbd::sim
{
constexpr auto STAGE_CONDENSE = 'C';
constexpr auto STAGE_NEW = 'N';
constexpr auto STAGE_SPREAD = 'S';
constexpr auto STAGE_INVALID = 'X';

void init_log_points(
  const string dir_out,
  bool do_log,
  size_t id,
  DurationSize start_time);
void log_point(size_t step,
               const char stage,
               const DurationSize time,
               const XYSize x,
               const XYSize y);
void log_points(size_t step,
                const char stage,
                const DurationSize time,
                const CellPoints& points);
};